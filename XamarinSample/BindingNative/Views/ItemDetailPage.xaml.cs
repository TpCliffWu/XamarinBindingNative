using System.ComponentModel;
using Xamarin.Forms;
using BindingNative.ViewModels;

namespace BindingNative.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}