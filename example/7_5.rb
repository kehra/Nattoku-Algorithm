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
graph['start']['a'] = 6
graph['start']['b'] = 2

graph['a'] = {}
graph['a']['fin'] = 1
graph['b'] = {}
graph['b']['a'] = 3
graph['b']['fin'] = 5
graph['fin'] = {}

costs = {}
costs['a'] = 6
costs['b'] = 2
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