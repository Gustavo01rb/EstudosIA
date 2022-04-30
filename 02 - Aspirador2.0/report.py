class Report:
    def __init__(self) -> None:
        self.__media = []
        self.__scenery_record = []
    
    def add_score(self, score):
        self.__media.append(score)
    
    def add_record(self, scenery, actions ):
        self.__scenery_record.append(
            {
                "scenery" : scenery,
                "actions" : actions
            }
        )

    def __dirty_or_clean(self, status):
        if status == 0:
            return "Limpo"
        return "Sujo"
    def __actions(self, action):
        if action == "Right":
            return "Movendo para a direita."
        if action == "Left":
            return "Movendo para a esquerda."
        return "Sujeira detectada. Limpando..."
        

    def print_records(self):
        for index, iterator in enumerate(self.__scenery_record):
            print("\n\n------------------------------------------------------------------------------")
            print("Interação: ", index + 1)
            print("\nCondição inicial do cenário:")
            print("    Lado esquerdo:", self.__dirty_or_clean(iterator["scenery"][0]))
            print("    Lado direito: ", self.__dirty_or_clean(iterator["scenery"][1]))
            print("\nLog de ações:")
            for actions in iterator["actions"]:
                print("    ",self.__actions(actions))
            print("\nPontuação obtida: ", self.__media[index])
            print("\n------------------------------------------------------------------------------")
    
    def print_results(self):
        print("\n\nPontuações obtidas: ")
        for index, result in enumerate(self.__media):
            print("Interação {} : {}".format(index,result))
        print("\n\nResultado médio: ", sum(self.__media) / len(self.__media))
        


