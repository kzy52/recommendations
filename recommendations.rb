# [[1.0, :user3], [0.16666666666666666, :user2], [0.09090909090909091, :user6], [0.07142857142857142, :user5], [0.05, :user4]]

def questions
  {
    user1: { question1: 2.0, question2: 3.0, question3: 3.0, question4: 3.0, question5: 5.0 },
    user2: { question1: 3.0, question3: 3.0, question4: 1.0, question5: 5.0, question6: 3.0, question7: 3.0 },
    user3: { question1: 2.0, question2: 3.0, question4: 3.0, question5: 5.0 },
    user4: { question1: 1.0, question2: 2.0, question4: 2.0, question5: 1.0 },
    user5: { question1: 2.0, question2: 1.0, question5: 2.0, question6: 4.0 },
    user6: { question1: 1.0, question2: 3.0, question4: 6.0, question7: 3.0 },
  }
end

def ratings
  {
    user1: { film1: 2.0, film2: 3.0, film3: 3.0, film4: 3.0, film5: 5.0 },
    user2: { film1: 3.0, film3: 3.0, film4: 1.0, film5: 5.0, film6: 3.0, film7: 3.0 },
    user3: { film1: 2.0, film2: 3.0, film4: 3.0, film5: 5.0 },
    user4: { film1: 1.0, film2: 2.0, film4: 2.0, film5: 1.0 },
    user5: { film1: 2.0, film2: 1.0, film5: 2.0, film6: 4.0 },
    user6: { film1: 1.0, film2: 3.0, film4: 6.0, film7: 3.0 },
  }
end

def sim_distance(data, user1, user2)
  common = data[user1].keys & data[user2].keys
  return 0 if common.size == 0
  sum_of_squares = common.inject(0) { |result, item| result + (data[user1][item] - data[user2][item])**2 }
  1/(1+sum_of_squares)
end

def getAffinity(user)
  scores = []
  questions.each do |key, value|
    if key != user
      scores << [sim_distance(questions, :user1, key), key]
    end
  end
  scores.sort.reverse
end

getAffinity(:user1)
