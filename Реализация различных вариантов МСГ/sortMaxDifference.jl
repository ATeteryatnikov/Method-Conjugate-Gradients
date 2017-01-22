# Программма sortMaxDifference.jl предназначена для сортировки по возрастанию максимального отклонения различных версий программы  godunovMatrix.jl
# Вывод программы существляется в консоли, постледняя строка - индексы указывают на номер версии, постледний столбец - размерность при которой производился запуск программы godunovMatrix.jl
# Программа считывет содержимое файла "compare maxDifference.txt" который должен находиться с программой в одном каталоге.


# Содержимое файла записывается в массив строк "strs"

File = open("compare\ maxDifference.txt","r")
strs = readlines(File)
mas = fill(0.0,7*4)
k=1

#формируем массив mas из 28 элементов Float64 (28 - суммарное количество каталогов с результатами от различных версий godunovMatrix
#заполняем массив числами расположенными в строках массива strs после ключевого слова "timer: "
for i in 1:1:70
  if (string(search(strs[i],"maxDifference"))[1] !='0')
     mas[k] = parse(Float64,strs[i][search(strs[i],"maxDifference")[end]+3:end-1])
     k = k+1
  end
end

# groupmas - cформированный двумерный массив 4*7 каждый столбец которого - вариант программы, каждая строка - параметры запуска програмы godunovMatrix
# на пересечении строк и столбцов - время работы.
# Номера столбцов в том же порядке, что и варинты программ godunov matrix в файле "compare time.txt".
groupmas = reshape(mas,4,7)

# Отсортируем по убыванию размерности с которыми производился запуск программ godunovMatrix.jl
# для этого достаточно поменять местами 1 и 2, 3 и 4 строки матрицы groupmas (изначальный порядок смотреть в файле "compare time.txt")
temp = groupmas[1,:]
groupmas[1,:] = groupmas[2,:]
groupmas[2,:] = temp
temp = groupmas[3,:]
groupmas[3,:] = groupmas[4,:]
groupmas[4,:] = temp

# добавляется вспомогательная строка для нумерации вариантов программы
groupmas = vcat(groupmas,[1.0,2,3,4,5,6,7]')
groupmas = hcat(groupmas,[200,100,50,25,0])
# сортируем по строке i
for i in 1:1:4
  println("сортировка по строке = ",i)
  display(sortcols(groupmas[i:end,:]))
end


