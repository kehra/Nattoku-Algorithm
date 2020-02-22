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
graph['start']['a'] = 5
graph['start']['b'] = 2

graph['a'] = {}
graph['a']['c'] = 4
graph['a']['d'] = 2
graph['b'] = {}
graph['b']['a'] = 8
graph['b']['d'] = 7
graph['c'] = {}
graph['c']['fin'] = 3
graph['c']['d'] = 6
graph['d'] = {}
graph['d']['fin'] = 1
graph['fin'] = {}

costs = {}
costs['a'] = 5
costs['b'] = 2
costs['c'] = Float::INFINITY
costs['d'] = Float::INFINITY
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