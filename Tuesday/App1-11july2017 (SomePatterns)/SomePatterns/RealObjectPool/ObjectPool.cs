using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SomePatterns.RealObjectPool
{
    class ObjectPool<T> : IObjectPool<T>
        where T : new()
    {
        private List<T> available;
        private List<T> used;

        public ObjectPool(int noOfObjects){
            available = new List<T>(noOfObjects);
            used = new List<T>(noOfObjects);

            for (int i = 0; i < noOfObjects; i++) {
                T obj = new T();
                available.Add(obj);
            }
        }

        public T Create()
        {
            T obj = available.Re
        }

        public void Release(T element)
        {
            throw new NotImplementedException();
        }
    }
    
}
