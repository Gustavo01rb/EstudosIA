from hoover import Hoover

def main():
    for left in range(2):
        for right in range(2):
            for lado in range(2):
                hoover = Hoover(lado)
                scenery = [left, right]
                print("\n\n Cenário: ", scenery)
                while(not hoover.finish_operation()):
                    print(hoover.aspirate(scenery))

main()