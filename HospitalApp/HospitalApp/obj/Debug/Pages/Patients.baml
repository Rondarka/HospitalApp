   M S B A M L   `   `   `  ����F  BHospitalApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:HospitalApp.PagesHospitalApp.Pages  5           HospitalApp.Pages.Patients   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      1localclr-namespace:HospitalApp.Pages     5        N� Title$  Patients��5	      .��5      �  � RowDefinitions 5   
   �� 5      $	��195 �6   �� 5      $
��257* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ PatientsGrid��5   �   $��Stretch=�6   $��1��61   $��Stretch=�6>   6�   �� 5   
   -   5         ��Name$ PatName��5   �   $
��Left=�6   $��23��6-   $��
118,30,0,0q�69    �� TextWrapping$
 Wrap=�6M   $	��Top=�6a   $	��120��6y   6�   �� 5   
   -   5        $ PatBirth��5   �   $
��Left=�6   $��23��6-   $��
118,83,0,0q�69   $
 Wrap=�6M   $	��Top=�6a   $	��120��6y   6�   �� 5   
   -   5        $ PatAdres��5   �   $
��Left=�6   $��23��6-   $��118,136,0,0q�69   $
 Wrap=�6N   $	��Top=�6b   $	��120��6z   6�   �� 5   
   -   5        $ PatPhone��5   �   $
��Left=�6   $��23��6-   $��
328,30,0,0q�69   $
 Wrap=�6M   $	��Top=�6a   $	��120��6y   6�   �� 5   
   -   5        $ PatSnils��5   �   $
��Left=�6   $��23��6-   $��
328,83,0,0q�69   $
 Wrap=�6M   $	��Top=�6a   $	��120��6y   6�   �� 5   
   -   5        $ PatPolis��5   �   $
��Left=�6   $��23��6-   $��328,136,0,0q�69   $
 Wrap=�6N   $	��Top=�6b   $	��120��6z   6�   �� 5   
   $��ФИО��6   $
��Left=�6   $	��Top=�69   $��	76,30,0,0q�6Q   �� 5   
   -   5         ��Name$ 
newPatient��5   �   $'��!Добавить пациента��6   $
��Left=�6-   $��484,136,0,0q�6H   $	��Top=�6]   $	��129��6u   $��23��6�   6�   �� 5   
   $��Дата рождения��6   $
��Left=�6(   $	��Top=�6C   $��	18,80,0,0q�6[   �� 5   
   $��
Адрес��6   $
��Left=�6    $	��Top=�6;   $��
70,135,0,0q�6S   �� 5   
   $��Телефон��6   $
��Left=�6"   $	��Top=�6=   $��
266,27,0,0q�6U   �� 5   
   $��
Снилс��6   $
��Left=�6    $	��Top=�6;   $��
280,83,0,0q�6S   �� 5   
   $��
Полис��6   $
��Left=�6    $	��Top=�6;   $��279,133,0,0q�6S   5      5       