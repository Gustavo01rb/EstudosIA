from presets import Location
from presets import State


class Hoover:
    def __init__(self, start_location) -> None:
        self.__location    = start_location
        self.history       = [State.NOT_VISITED, State.NOT_VISITED] 
        self.__score       = 0
        self.__hit_counter = 0
    
    @property
    def score(self):
        return self.__score
    def finish_operation(self):
        return self.__hit_counter >= 4

    def __move(self):
        if self.__location == Location.LEFT.value:
            self.__location = Location.RIGHT.value
            return "Movendo para o lado direito."
        self.__location = Location.LEFT.value
        return "Movendo para o lado esquerdo."
    
    def aspirate(self, scenery):
        if scenery[self.__location] == State.DIRTY.value:
            self.__score += 5
            scenery[self.__location] = State.CLEAN.value
            return "Limpando!"
        elif scenery[self.__location] == State.CLEAN.value:
            self.__score -= 1
            self.__hit_counter += 1 
            return self.__move()