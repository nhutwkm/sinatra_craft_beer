class CategoriesController < ApiController
  get '/' do
    @categories = Category.all
    # response
    # { data: @categories }.to_json
    # { data: @categories.as_json(only: %i[id name]) }.to_json
    # { data: @categories.as_json(except: %i[id name]) }.to_json
    # { data: @categories.map
    # { |category| CategorySerializer.new(category) } }.to_json
    json @categories, each_serializer: Categories::IndexSerializer, root: 'data'
  end

  post '/' do
    # require 'pry'
    # binding.pry
    begin
      category = Category.new({ name: " #{params['name']} " })
      category.save!
      # successfully
      '<h1> created </h1>'
    rescue
      'errors'
      # errors
    end
  end

  get '/:category_id/beers' do
    @beers = Beer.where `'category_id' == params[:category_id]`
    json @beers, each_serializer: Categories::ListBeerSerializer, root: 'data'
  end
end
