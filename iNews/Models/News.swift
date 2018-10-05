//
//  News.swift
//  iNews
//
//  Created by Allan on 04/10/18.
//  Copyright © 2018 Allan Pacheco. All rights reserved.
//

import Foundation
import SwiftyJSON

struct News {
    
    private let kSource = "source"
    private let kTitle = "title"
    private let kDescription = "description"
    private let kContent = "content"
    private let kAuthor = "author"
    private let kURL = "url"
    private let kImageURL = "urlToImage"
    private let kPublishedAt = "publishedAt"
    
    var source: Source
    var author: String?
    var title: String
    var description: String
    var url: String?
    var imageURL: String?
    var publishedAt: Date?
    var content: String
    
    var hasImage: Bool{
        return self.imageURL != nil
    }
    
    init?(with json: JSON) {
        guard let source = Source(with: json[kSource]), let title = json[kTitle].string, let description = json[kDescription].string, let content = json[kContent].string else { return nil }
        self.source = source
        self.title = title
        self.description = description
        self.content = content
        self.author = json[kAuthor].string
        self.url = json[kURL].string
        self.imageURL = json[kImageURL].string
        self.publishedAt = Date(with: json[kPublishedAt].string)
    }
    
    
}


/*
 
 {
 "source": {
 "id": "globo",
 "name": "Globo"
 },
 "author": null,
 "title": "Reservas totais da CVC crescem 30,8% no 3Âº trimestre",
 "description": "A operadora de turismo CVC anunciou nesta quinta-feira que as reservas confirmadas somaram 3,48 bilhÃµes de reais no terceiro trimestre",
 "url": "https://extra.globo.com/noticias/economia/reservas-totais-da-cvc-crescem-308-no-3-trimestre-23128399.html",
 "urlToImage": "https://extra.globo.com/skins/extra/images/extra-face-1.jpg",
 "publishedAt": "2018-10-04T22:48:00Z",
 "content": "SÃƒO PAULO (Reuters) - A operadora de turismo CVC anunciou nesta quinta-feira que as reservas confirmadas somaram 3,48 bilhÃµes de reais no terceiro trimestre. Em totais, o nÃºmero representa um aumento de 30,8 por cento ante mesma etapa de 2017. Na comparaÃ§Ã£o prÃ³-forma, que desconsidera eventos nÃ£o recorrentes, o aumento foi de 10,8 por cento, tambÃ©m ano a ano. Por segmentos, as reservas totais de lazer cresceram 10,8 por cento ano a ano. JÃ¡ as reservas do segmento de viagens corporativas cresceram 3,4 por cento contra um ano antes, 'perdendo um pouco o fÃ´lego do inÃ­cio do ano em funÃ§Ã£o das incertezas polÃ­ticas e econÃ´micas que via de regra afetam o setor de viagens a negÃ³cio'. Segundo a CVC, essa evoluÃ§Ã£o 'confirmou a expectativa de que os impactos gerados pela greve dos caminhoneiros, pela desvalorizaÃ§Ã£o cambial e efeitos da Copa do Mundo eram temporÃ¡rios e nÃ£o representavam mudanÃ§a de tendÃªncia'. No ano atÃ© setembro, o crescimento das reservas confirmadas foi de 9,7 por cento, para 9,72 bilhÃµes de reais. De julho a setembro, a CVC anunciou a compra de trÃªs empresas: a Esferatur e os argentinos Grupo Bibam e Ola TransatlÃ¡ntica."
 }
 
 
 
 
 
 
 
 
 */
