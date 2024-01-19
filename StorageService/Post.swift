//
//  Post.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

public struct Post {
    public let autor: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
}

public var posts : [Post] = [
    Post(autor: "vedmak.official", description: "Новые кадры со сьемок второго сезона сериала \"Ведьмак \"", image: "witcher", likes: 240, views: 312),
    Post(autor: "Нетология. Меняем карьеру через образование.", description: "«Нетоло́гия» — российская компания и образовательная онлайн-платформа, запущенная в 2011 году. Одна из ведущих российских компаний онлайн-образования[1]. Входит в IT-холдинг TalentTech, объединяющий компании по трём направлениям: EdTech, HRTech и Freelance. EdTech-сегмент холдинга, наряду с «Нетологией» (включая EdMarket), представлен компаниями «Фоксфорд» и «TalentTech.Обучение».", image: "netology", likes: 766, views: 893),
    Post(autor: "vedmak.official", description: "Новые кадры со сьемок второго сезона сериала \"Ведьмак \"", image: "witcher", likes: 240, views: 312),
    Post(autor: "Нетология. Меняем карьеру через образование.", description: "«Нетоло́гия» — российская компания и образовательная онлайн-платформа, запущенная в 2011 году. Одна из ведущих российских компаний онлайн-образования[1]. Входит в IT-холдинг TalentTech, объединяющий компании по трём направлениям: EdTech, HRTech и Freelance. EdTech-сегмент холдинга, наряду с «Нетологией» (включая EdMarket), представлен компаниями «Фоксфорд» и «TalentTech.Обучение».", image: "netology", likes: 766, views: 893)
]


