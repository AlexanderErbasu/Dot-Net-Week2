﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SomePatterns.CommandComposition
{
    public interface ICompositeCommand : ICommand
    {
        void Add(ICommand command);
        void Remove(ICommand command);
    }
}
