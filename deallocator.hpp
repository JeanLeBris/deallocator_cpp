#include <iostream>

namespace deallocator{
    class Garbage{
        private:
            int length;
            int bag_size;
            int garbage_can_size;
            void** garbage_can;

        public:
            Garbage();

            int throw_away(void* variable);

            int recycle(void* old_variale, void* new_variable);

            int order_66();
    };

    Garbage::Garbage(){
        this->length = 0;
        this->bag_size = 100;
        this->garbage_can_size = 0;
        this->garbage_can = NULL;
    }

    int Garbage::throw_away(void* variable){
        if(variable != NULL){
            if(this->length == this->garbage_can_size){
                this->garbage_can = (void**) realloc(this->garbage_can, sizeof(void*) * (this->garbage_can_size + this->bag_size));
                this->garbage_can_size += this->bag_size;
            }

            this->garbage_can[this->length] = variable;
            this->length++;
        }

        return 0;
    }

    int Garbage::recycle(void* old_variable, void* new_variable){
        bool found = false;

        if(old_variable == NULL){
            this->throw_away(new_variable);
        }
        else{
            // if(new_variable != NULL){
            if(true){
                for(int i = 0; i < this->length && !found; i++){
                    if(old_variable == garbage_can[i]){
                        this->garbage_can[i] = new_variable;
                        found = true;
                    }
                }
                if(!found){
                    this->throw_away(new_variable);
                }
            }
        }

        return 0;
    }

    int Garbage::order_66(){
        for(int i = 0; i < this->length; i++){
            free(this->garbage_can[i]);
        }
        free(this->garbage_can);

        return 0;
    }
}