
STOPWORDS = /\b(?:#{ %w[ a between both but by can't cannot could couldn't did didn't do does doesn't doing don't down during each few for from further had hadn't has hasn't have haven't having he he'd he'll he's her here here's hers herself him himself his how how's i i'd i'll i'm i've if in into is isn't it it's its itself let's me more most mustn't my myself no nor not of off on once only or other ought our ours ourselves out over own same shan't she she'd she'll she's should shouldn't so some such than that that's the their theirs them themselves then there there's these they they'd they'll they're they've this those through to too under until up very was wasn't we we'd we'll we're we've were weren't what what's when when's where where's which while who who's whom why why's with won't would wouldn't you you'd you'll you're you've your yours yourself yourselves want].join('|') })\b/i
  
  @units = {comfortglide_vanilla: ["comfortglide", "comfort", "glide", "vanilla", "creme", "Crème", "scented", "razor", "soapbar", "five", "5", "experiential", "experience", "premium"], comfortglide_olay: ["comfortglide", "comfort", "glide", "olay", "scented", "razor", "soapbar", "five", "5", "experiential", "experience", "premium"], trimmer: ["trimmer", "bikini", "razor", "three", "3", "sensitive"], swirl_blue: ["swirl", "razor", "blue", "five", "5", "no soap", "flexiball", "without"], swirl_purple: ["swirl", "purple", "five", "5", "no soap", "flexiball", "without"], embrace_sensitive: ["embrace", "sensitive", "five", "5", "moisture", "aloe", "aloevera", "no soap", "without"], snap_embrace: ["snap", "embrace", "razor", "pink", "travel", "small", "compact", "case", "five", "5", "no soap", "without", "smooth"], comfortglide_tea: ["comfortglide", "comfort", "glide", "tea", "white", "white tea", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], comfortglide_sugarberry: ["comfortglide", "comfort", "glide", "olay", "sugarberry", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], comfortglide_freesia: ["comfortglide", "comfort", "glide", "freesia", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], embrace_green: ["embrace", "smooth", "razor", "five", "5", "green", "no soap", "without"], original: ["original", "razor", "three", "3", "no soap", "without", "cushion"], embrace_purple: ["embrace", "smooth", "razor", "five", "5", "purple", "no soap", "without", "purple", "passionista"], divine_sensitive: ["divine", "sensitive", "razor", "three", "3", "no soap", "without"], embrace_pink: ["embrace", "smooth", "razor", "five", "5", "pink", "no soap", "without"]}
  
  @refills = {comfortglide_vanilla: ["comfortglide", "comfort", "glide", "vanilla", "creme", "Crème", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], swirl: ["swirl", "razor", "five", "5", "no soap", "flexiball"], embrace: ["embrace", "smooth", "razor", "five", "5", "no soap", "without"], comfortglide_sugarberry: ["comfortglide", "comfort", "glide", "olay", "sugarberry", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], original: ["original", "razor", "three", "3", "no soap", "without", "cushion"], embrace_sensitive: ["embrace", "sensitive", "razor", "five", "5", "moisture", "aloe", "aloevera", "no soap", "without"], comfortglide_freesia: ["comfortglide", "comfort", "glide", "freesia", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], comfortglide_tea: ["comfortglide", "comfort", "glide", "white tea", "white", "tea", "whitetea", "scented", "razor", "soap bar", "five", "5", "experiential", "experience", "premium"], embrace_purple: ["embrace", "smooth", "razor", "five", "5", "passionista", "passion", "no soap", "without", "purple"], divine_sensitive: ["divine", "sensitive", "razor", "three", "3", "no soap", "without"]}
  
  @disposable = {embrace: ["embrace", "smooth", "three", "3", "no soap", "without"], embrace_sensitive: ["embrace", "sensitive", "three", "3", "purple", "moisture", "aloe", "aloevera", "no soap", "without"], oceana: ["oceana", "three", "3", "comfort", "cushion", "blue", "no soap", "without"], tropical: ["tropical", "comfort", "cushion", "three", "3", "scented", "scent", "no soap", "without"], sensitive: ["comfort", "cushion", "sensitive", "three", "3", "moisture", "aloe", "aloevera", "no soap", "without"], simply: ["simple", "3", "three", "square", "lubrastrip", "lube", "pivoting", "pivot", "smooth"]}
  
  def score(arr, hash_name)
    @scores = Hash.new
    arr.each do |i|
      hash_name.each do |key, value|
        if value.include?(i)
          if @scores[key] == nil
            @scores[key] = 1
          else
            @scores[key] += 1
          end
        end
      end
    end
  end
  
  
  def product_selector(string)
    string.gsub!(STOPWORDS,'')
    input_array = string.split(" ")
    p input_array
    if input_array.include?("disposable")
      score(input_array, @disposable)
      return @scores.key(@scores.values.max)
    elsif arr.include?("refill")
      score(input_array, @refills)
      return @scores.key(@scores.values.max)
    else
      score(input_array, @units)
      return @scores.key(@scores.values.max)
    end
  end
  
  product_selector("I want a disposable razor scented with 3 blades for sensitive skin")