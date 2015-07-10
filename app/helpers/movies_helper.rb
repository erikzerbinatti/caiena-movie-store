module MoviesHelper

  def actors_movie(actors)
    content_tag :ul do
      actors.collect do |a|
        concat content_tag(:li, a.name)
      end  
    end
  end
end
