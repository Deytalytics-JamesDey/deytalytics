import csv
import sys

csvFile = sys.argv[1]+".csv"
xmlFile = sys.argv[1]+".xml"

csvData = csv.reader(open(csvFile))
xmlData = open(xmlFile, 'w')
rowNum = 0
xmlData.write('    <topLevelDictionaryEntry xsi:type="iso20022:BusinessComponent"')
xmlData.write(' xmi:id=""')
xmlData.write(' name="' + sys.argv[1] + '"')
xmlData.write(' definition=""')
xmlData.write(' registrationStatus="Unregistered"')
xmlData.write(' subType=""')
xmlData.write(' derivationComponent=""')
xmlData.write(' associationDomain=""')
xmlData.write(' derivationElement="">' + "\n")
for row in csvData:
    if rowNum == 0:
        tags = row
        # replace spaces w/ underscores in tag names
        for i in range(len(tags)):
            tags[i] = tags[i].replace(' ', '_')
            if tags[i] == "Id":
                tags[i]="OpenBankId"

    elif row[0]: 
        xmlData.write('      <element')
        xmlData.write(' xsi:type="iso20022:BusinessAttribute"')
        xmlData.write(' xmi:id=""')
        xmlData.write(' registrationStatus="unregistered"')
        for i in range(len(tags)):
            if (tags[i] == "Card") & (len(row[i])>0):
               xmlData.write(' minOccurs="' \
                          + row[i][0] + '"')
               xmlData.write(' maxOccurs="' \
                          + row[i][3].replace('n','unbounded') + '"')
            elif tags[i] == "Business_Term":
               xmlData.write(' name="' \
                          + row[i].replace(' ','') + '"')
               xmlData.write(' '+ tags[i] + '="' \
                          + row[i] + '"')
            elif tags[i]:
               xmlData.write(' '+ tags[i] + '="' \
                          + row[i] + '"')
        xmlData.write(' />' + "\n")            
    rowNum +=1

xmlData.write('    </topLevelDictionaryEntry>' + "\n")
xmlData.close()
