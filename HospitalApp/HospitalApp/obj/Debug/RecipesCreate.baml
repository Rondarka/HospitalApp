   M S B A M L   `   `   `  ����F  BHospitalApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:HospitalAppHospitalApp  5   	       HospitalApp.RecipesCreate   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:HospitalApp     5   	     � Title$;  5Формирование записи на прием��5   	   $��433.644��6.   $��322.538��6?   .��5	      � .+�5
   
   �� $��Дата��6   $
��Left=�6   $��
41,118,0,0q�6:   $	��Top=�6N   �� 5   
   $.��(Начало интервала (мин)��6   $��Center=�61   $��	0,159,0,0q�6N   $	��Top=�6a   �� 5   
   $4��.Окончание интервала (мин)��6   $��Center=�64   $��	0,219,0,0q�6Q   $	��Top=�6d   �� 5   
   -   5         ��Name$ IntrevalEnd��5   �   $��Center=�6   $��23��6/    �� TextWrapping$
 Wrap=�6;   $	��Top=�6O   $	��104��6g   $��	0,250,0,0q�6s   6�   �� 5   
   -   5        $ IntervalStart��5   �   $��Center=�6   $��23��6/   $
 Wrap=�6;   $	��Top=�6O   $	��104��6g   $��	0,191,0,0q�6s   6�   �� 5   
   -   5        $ 
RecipeDate��5   �   $��Center=�6   $��23��6/   $
 Wrap=�6;   $	��Top=�6O   $	��104��6g   $��	0,121,0,0q�6s   6�   �� 5   
   -   5         ��Name$ addMin��5   t   $#��Создание записи��6   $��Center=�6*   $	��Top=�6G   $��201,10,10,0q�6_   $y�Hidden=�6�   �� 5   
   $#��Создание записи��6   $��Center=�6*   $	��Top=�6G   $��0,36,0,0q�6_   �� 5   
   $��Врач��6   $
��Left=�6   $��	41,69,0,0q�6:   $	��Top=�6M   �� 5   
   -   5         ��Name$ ComboDoctors��5   g   $��Center=�6   $��0,73,0,0q�61   $	��Top=�6C   $	��126��6[   6}   �� 5   
   -   5        $!��Создать записи��5      $��Center=�6*   $��	0,359,0,0q�6G   $	��Top=�6Z   $	��126��6r   6~   �� 5   
   $&�� Время приема (мин)��6   $��Center=�6-   $��	0,283,0,0q�6J   $	��Top=�6]   �� 5   
   -   5        $ 	timePriem��5   �   $��Center=�6   $��23��6/   $
 Wrap=�6;   $	��Top=�6O   $	��104��6g   $��	0,314,0,0q�6s   6�   5      5      