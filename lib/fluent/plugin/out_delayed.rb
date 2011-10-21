#
# Fluent-Plugin-Delayed
#
# Copyright (C) 2011 Shuhei Tanuma
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#
module Fluent

class DelayedEvent < ::Coolio::TimerWatcher
  def initialize(tag, event, chain,output, delay)
    super(delay, false)
    @tag = tag
    @event = event
    @output = output
    @chain = chain
  end
  
  def on_timer
    @output.emit(@tag, @event, @chain)
  end  
end

class DelayedOutput < Output
  Plugin.register_output('delayed',self)
  
  def initialize()
    @coolio = Coolio::Loop.default
    @thread = Thread.new(&method(:run))
  end
  
  def configure(conf)
    conf.elements.select {|e|
      e.name == 'store'  
    }.each {|e|
      type = e['type']
      @output = Plugin.new_output(type)
    }
  end
  
  def emit(tag, es, chain)
    es.each {|time,record|
      now = Engine.now
      delay = time - now

      if delay < 0 then
        delay = 0
      end
      es2 = MultiEventStream.new
      es2.add(time,record)

      @coolio.attach DelayedEvent.new(tag, es2, chain, @output, delay)
    }
  end
  
  private
  def run
    @coolio.run
  end
end

end
