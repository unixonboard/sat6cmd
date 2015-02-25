#!/usr/bin/env ruby
#####################################################################################
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
#
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
##    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##    See the License for the specific language governing permissions and
##    limitations under the License.
##
######################################################################################
##
## Contact Info: <kenneth.evensen@redhat.com> and <lester@redhat.com>
##
######################################################################################

class ActivationKeys
  def initialize
    @client = SatelliteConnection.instance
  end
  
  
  def listall(args)
    
    if args.empty?
      @client.call("/katello/api/"+@client.api_version+"/activation_keys",nil)
    elsif !args['-e'].nil?
      @client.call("/katello/api/"+@client.api_version+"/environments/#{args['-e']}/activation_keys",nil)
    elsif !args['-o'].nil?
      @client.call("/katello/api/"+@client.api_version+"/organizations/#{args['-o']}/activation_keys",nil)
    end    
    
  end
end