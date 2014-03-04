#
# Copyright (C) 2012 Onyx Point, Inc. <http://onyxpoint.com/>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
module Puppet::Parser::Functions
    newfunction(:concat_output, :type => :rvalue, :doc => "Returns the output file for a given concat build.") do |args|
        vardirfact = lookupvar('puppet_vardir')

        if vardirfact.nil? || vardirfact == :undefined
            clientvardir = Puppet[:vardir]
        else
            clientvardir = vardirfact
        end

        "#{clientvardir}/concat/output/#{args.first}.out"
    end
end
