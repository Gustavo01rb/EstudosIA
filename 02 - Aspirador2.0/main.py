from hoover import Hoover
from report import Report

#Definindo a tabela verdade são 8 possibilidades diferentes.
#Os 3 'fors' da função indicam:
# 1-> A posição inicial do robô, (tanto esquerda quanto direita)
# 2-> Indica o estado do lado lado direito  (Limpo ou sujo)
# 3-> Indica o estado do lado lado esquerdo (Limpo ou sujo)

def main():
    report = Report()
    for initial_position in range(2):
        for right in range(2):
            for left in range(2):
                hoover = Hoover(initial_position)
                scenery = [left, right] 
                records = []
                while(not hoover.finish_operation()):
                    records.append(hoover.reflex_vacuum_agent(scenery))
                report.add_record([left, right], records)
                report.add_score(hoover.score)
    report.print_records()
    report.print_results()

main()