#include "../include/deallocator.hpp"

namespace deallocator{
    /**
     * Declares a new empty garbage can
     */
    Garbage::Garbage(){
        this->length = 0;
        this->bag_size = 100;
        this->garbage_can_size = 0;
        this->garbage_can = NULL;
    }

    /**
     * Add an address of an allocated variable in the garbage can
     * 
     * @param variable The address of the variable to put in the garbage can
     * 
     * @return 0
     */
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

    /**
     * Replace an address in the garbage can with another one
     * 
     * @param old_variable The address to replace
     * @param new_variable The address to replace the old one with
     * 
     * @return 0
     */
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

    /**
     * Free all the addresses in the garbage can
     * 
     * @return 0
     */
    int Garbage::order_66(){
        for(int i = 0; i < this->length; i++){
            free(this->garbage_can[i]);
        }
        free(this->garbage_can);

        return 0;
    }
}