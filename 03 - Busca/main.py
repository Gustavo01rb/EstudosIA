from search import *

class VacuumCleaner(Problem):

    def __init__(self, initial_state):
        super().__init__(initial_state, self.goal_generator())

    def goal_generator(self):
        list_goal = list()
        list_aux = list()

        for i in range(9):
            for j in range(9):
                if i == j:
                    list_aux.append((1,0))
                    continue
                list_aux.append((0,0))
            list_goal.append(list_aux)
            list_aux = []
        return list_goal


    def actions(self, state):
        
        possible_actions = ['UP', 'DOWN', 'LEFT', 'RIGHT']
        index_blank_square = self.find_blank_square(state)

        if index_blank_square % 3 == 0:
            possible_actions.remove('LEFT')
        if index_blank_square < 3:
            possible_actions.remove('UP')
        if index_blank_square % 3 == 2:
            possible_actions.remove('RIGHT')
        if index_blank_square > 5:
            possible_actions.remove('DOWN')

        return possible_actions
    def result(self, state, action):
        """Return the state that results from executing the given
        action in the given state. The action must be one of
        self.actions(state)."""
        raise NotImplementedError

    def goal_test(self, state):
       return state in self.goal

    def path_cost(self, c, state1, action, state2):
        """Return the cost of a solution path that arrives at state2 from
        state1 via action, assuming cost c to get up to state1. If the problem
        is such that the path doesn't matter, this function will only look at
        state2. If the path does matter, it will consider c and maybe state1
        and action. The default method costs 1 for every step in the path."""
        return c + 1

    def value(self, state):
        """For optimization problems, each state has a value. Hill Climbing
        and related algorithms try to maximize this value."""
        raise NotImplementedError


teste = VacuumCleaner([(0,1), (0,1), (0,1), (0,0), (1,0), (0,0), (0,0), (0,0), (0,0)])
print(teste.goal)

print(
      ( [(1, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0), (0, 0)] in teste.goal )
)