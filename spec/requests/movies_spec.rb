require 'swagger_helper'

describe 'Movies API app' do

  path '/movies' do
    get('list movies') do
      tags 'Movies'
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
  end

  path '/movies' do
    post 'Creates a movie' do
      tags 'Movies'
      consumes 'application/json'
      parameter name: :movie, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: "foo" },
          description: { type: :string, example: "bar" }
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
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show movie') do
      tags 'Movies'
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

  path '/movies/{id}' do
    patch('update movie by id') do
      tags 'Movies'
      parameter name: 'id', in: :path, type: :string, description: 'id'
      parameter name: 'name', in: :header, type: :string, description: 'name'
      parameter name: 'description', in: :header, type: :string, description: 'description'      
      response '200', :success do
        let(:id) { '123' }
        let(:name) { 'new_name' } 
        let(:description) { 'new_description' } 
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end        
        run_test!
      end

      response '404', :not_found do
        let(:name) { 'new_name' } 
        let(:description) { 'new_description' } 
        let!(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/movies/{id}' do
    delete('delete movie') do
      tags 'Movies'
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
