#ifndef DEALLOCATOR_HPP
#define DEALLOCATOR_HPP

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
}

#endif