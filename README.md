### Slides at GitHub page
- https://ejameslin.github.io/iPlayground2019

### About
- 大型專案生存守則 - 10x 加速開發技巧
> 在大型專案中血與淚的經驗，改幾行 Code，Incremental Build 也要數十分鐘，只能去喝杯咖啡？ 除了加速 Build Time 之外的另一個思路：不要 Build & Run。 分享有哪些技巧能更快看到程式碼改動結果，會遇到的問題與解法。
- The Survival Guide of Building Huge App - 10x Faster Dev/Verification Cycle
- This is the slide presented at [iPlayground2019](https://iplayground.io/2019)

### Running at Local
- Start local server by 
```
python -m SimpleHTTPServer 4000
```
- or by
```
ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 4000, :DocumentRoot => Dir.pwd).start'
```
- Then open: http://localhost:4000

### Special Thanks
- The slides is made by markdown language using https://github.com/gnab/remark
- The css theme is forked from [Blue Standard Theme](https://github.com/sfc-arch/remark-theme)
