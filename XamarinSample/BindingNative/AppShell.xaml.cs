using System;
using System.Collections.Generic;
using BindingNative.ViewModels;
using BindingNative.Views;
using Xamarin.Forms;

namespace BindingNative
{
    public partial class AppShell : Xamarin.Forms.Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(ItemDetailPage), typeof(ItemDetailPage));
            Routing.RegisterRoute(nameof(NewItemPage), typeof(NewItemPage));
        }

    }
}
