from vacuum import VacuumCleaner
from vacuum import RandonVacuumCleaner
from search import depth_first_graph_search as busca_em_profundidade
from search import breadth_first_graph_search as busca_em_largura
from search import uniform_cost_search as custo_uniforme
from search import depth_limited_search as profundidade_limitada
from search import iterative_deepening_search as busca_interativa
import random



class Presets:
    @staticmethod
    def get_proposed_suggestion():
        return ((0, 1), (0, 1), (0, 1),
                (0, 0), (1, 0), (0, 0),
                (0, 0), (0, 0), (0, 0))

    def probability(self):
        probability = random.sample(range(4), k=1)
        if probability[0] == 1:
            return 1
        return 0
    
    def generate_random_scenario(self):
        aux = list()
        for i in range(9):
            aux.append( (0, self.probability()) )
        
        initial_position = random.sample(range(4), k=1)[0]
        aux[initial_position] = (1, 1)

        return tuple(aux) 


presset = Presets()
environment = presset.generate_random_scenario()


def print_state(state, title=None):
    if(title != None):
        print("\n {} \n".format(title))
    for index, iterator in enumerate(state):
        if (index+1) % 3 == 0:
            print(iterator)
            continue
        print(iterator, end="")


def print_info(title, initial_state):
    print("\n\n-----------------------------------------------------------------")
    print(" " + title)
    print("\nEstado inicial:")
    print_state(initial_state)


def questao2():
    print("\n\nQuestão 2: ")
    print_info("Busca de custo uniforme", Presets.get_proposed_suggestion())
    problem = VacuumCleaner(Presets.get_proposed_suggestion())
    print("\nSolução: ", end='')
    print(custo_uniforme(problem).solution())
    print("Custo: " + str(problem.custo))
    print_state(custo_uniforme(problem).state, "Estado final:")
    print("-----------------------------------------------------------------\n\n")



def questao3():
    print("\n\nQuestão 3: ")
    print_info("Busca em profundidade", environment)
    problem = VacuumCleaner(environment)
    print("\nSolução: ", end='')
    print(busca_em_profundidade(problem).solution())
    print("Custo: " + str(problem.custo))
    print_state(busca_em_profundidade(problem).state, "Estado final:")

    print_info("Busca em largura", environment)
    problem = VacuumCleaner(environment)
    print("\nSolução: ", end='')
    print(busca_em_largura(problem).solution())
    print("Custo: " + str(problem.custo))
    print_state(busca_em_largura(problem).state, "Estado final:")

    print_info("Busca de custo uniforme", environment)
    problem = VacuumCleaner(environment)
    print("\nSolução: ", end='')
    print(custo_uniforme(problem).solution())
    print("Custo: " + str(problem.custo))
    print_state(custo_uniforme(problem).state, "Estado final:")

    print_info("Busca em profundidade limitada",
               environment)
    problem = VacuumCleaner(environment)
    print("\nSolução: ", end='')
    print(profundidade_limitada(problem).solution())
    print("Custo: " + str(problem.custo))
    print_state(profundidade_limitada(problem).state, "Estado final:")

    print_info("Busca interativa", environment)
    problem = VacuumCleaner(environment)
    print("\nSolução: ", end='')
    print(busca_interativa(problem).solution())
    print("Custo: " + str(problem.custo))
    print_state(busca_interativa(problem).state, "Estado final:")

    print("-----------------------------------------------------------------\n\n")


def questao4():
    print("\n\nQuestão 4: ")
    print_info("Agente aleatório", environment)
    vaccum = RandonVacuumCleaner()
    teste = environment
    while not vaccum.goal_test(teste):
        teste = vaccum.movement(teste)
    print("\nSolução: ", vaccum.history)
    print("Custo: " + str(vaccum.coast))
    print_state(teste, "Estado final:")

questao2()
questao3()
questao4()
