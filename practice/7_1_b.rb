def find_lowest_cost_node(costs, processed)
  lowest_cost = Float::INFINITY
  lowest_cost_node = nil

  costs.each do |node, cost|
    if cost < lowest_cost && !processed.include?(node)
      lowest_cost = cost
      lowest_cost_node = node
    end
  end

  lowest_cost_node
end

graph = {}
graph['start'] = {}
graph['start']['a'] = 10

graph['a'] = {}
graph['a']['b'] = 20
graph['b'] = {}
graph['b']['c'] = 1
graph['b']['fin'] = 30
graph['c'] = {}
graph['c']['a'] = 1
graph['fin'] = {}

costs = {}
costs['a'] = 10
costs['b'] = Float::INFINITY
costs['c'] = Float::INFINITY
costs['fin'] = Float::INFINITY

parents = {}
parents['a'] = 'start'
parents['b'] = 'start'
parents['fin'] = nil

processed = []

node = find_lowest_cost_node(costs, processed)
until node.nil?
  cost = costs[node]
  neighbors = graph[node]
  neighbors.each do |neighbor, n_cost|
    new_cost = cost + n_cost
    if costs[neighbor] > new_cost
      costs[neighbor] = new_cost
      parents[neighbor] = node
    end
  end
  processed << node
  node = find_lowest_cost_node(costs, processed)
end

puts costs
puts parents