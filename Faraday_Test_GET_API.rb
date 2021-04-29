#!/usr/bin/ruby

require 'faraday'
require 'json'
require "test/unit/assertions"
include Test::Unit::Assertions


# Get the response from the API
res = Faraday.get('https://jsonplaceholder.typicode.com/posts')

# Get the status code
statusCode = res.status

# Get the response body
data = JSON.parse(res.body)


#Getting the data
userid0 = data[0]['userId']
id0 = data[0]['id']
id1 = data[1]['id']
id3 = data[1]['id']
id99 = data[99]['id'] 
title0 = data[0]['title']
title1 = data[1]['title']
body0 =  data[0]['body']
body1 =  data[1]['body']


serverName = res.headers['server']
resDate = res.headers['date']
contentType = res.headers['content-type']

#Print all the Headers
pp res.headers




#####ASSERTIONS########

#Verifying the header values

# Verify if the content type is application/json
assert_equal "application/json; charset=utf-8", contentType, 'The Content type is not Equal'

# Verify the server name 
assert_equal "cloudflare", serverName,'The Server name is not Equal'

  

#Positive Tests

 assert_equal(200, statusCode,'Status code is not 200')

 assert_not_equal(404, statusCode,'Both are not equal')

 assert_not_nil(data,'Object not there')

 assert_equal("sunt aut facere repellat provident occaecati excepturi optio reprehenderit", title0, 'Both the values not Equal')

 assert_not_equal("sunt aut facere repellat provident occaecati excepturi optio reprehenderit_009_added", title0, 'Both the values are equal')

 assert_not_equal(title0,title1,'Title from dataset1 is equal to dataset2')

 assert_equal(100,id99,'Id is not equal')

 assert_same(1,userid0,'User Id is not same')

 assert_not_same(id0, id1, 'Id is same for both the values')

 

#Negative Tests

 assert_equal(404, statusCode,'Both are not equal')

 assert_equal("sunt aut facere repellat provident occaecati excepturi optio reprehenderit_added_to_check", title0 , "Both the values not Equal")

 assert_same(5,userid0,'User Id is not same')

 assert_not_same(id1, id1, 'Id is same for both the values')







