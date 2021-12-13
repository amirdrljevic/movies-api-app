require 'swagger_helper'

RSpec.describe 'movies', type: :request do

  path '/movies' do

    get('list movies') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post 'Creates a movie' do
      tags 'Movies'
      consumes 'application/json'
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: "yassin" },
          description: { type: :string, example: "Amir" }
        },
        required: [ 'name']
      }

      response '201', 'movie created' do
        let(:movie) { { name: 'foo', description: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:movie) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/movies/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show movie') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update movie') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update movie') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete movie') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
