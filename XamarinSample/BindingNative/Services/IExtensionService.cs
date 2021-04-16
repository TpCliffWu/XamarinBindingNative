using System;
namespace BindingNative
{
    public interface IExtensionService
    {
        string FunctionGetString();

        int SumArray(int[] intArray);

        string ToBase64(string str);
    }
}
