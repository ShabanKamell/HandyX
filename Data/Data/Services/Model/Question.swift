//
// Created by mac on 11/30/19.
// Copyright (c) 2019 sha. All rights reserved.
//

import Foundation

public struct Question {
    public let id: Int
    public let parentValue: String?
    public let serviceId: String
    public let title: String
    public let inputType: String
    public let questionType: String
    public let multipleSelect: String
    public let values: [QuestionsValue]?
}

public struct QuestionMapper: Mapper {
    public typealias I = QuestionDto
    public typealias O = Question

    public init() {}

    public func map(_ input: QuestionDto) -> Question {
        Question(id: input.id,
                parentValue: input.parentValue,
                serviceId: input.serviceId,
                title: input.title,
                inputType: input.inputType,
                questionType: input.questionType,
                multipleSelect: input.multipleSelect,
                values: NullableInputListMapper(QuestionsValueMapper()).map(input.values)
        )
    }
}

// MARK: - QuestionsValue
public struct QuestionsValue {
    public let id: Int
    public let questionId: String
    public let value: String
    public let quantity: String
    public let fixedPrice: String
    public let pricePerHour: String
    public let questionByValue: [QuestionByValue]?
}

public struct QuestionsValueMapper: Mapper {
    public typealias I = QuestionsValueDto
    public typealias O = QuestionsValue

    public init() {}

    public func map(_ input: QuestionsValueDto) -> QuestionsValue {
        QuestionsValue(id: input.id,
                questionId: input.questionId,
                value: input.value,
                quantity: input.quantity,
                fixedPrice: input.fixedPrice,
                pricePerHour: input.pricePerHour,
                questionByValue: NullableInputListMapper(QuestionByValueMapper()).map(input.questionByValue)
        )
    }
}

// MARK: - QuestionByValue
public struct QuestionByValue {
    public let id: Int
    public let parentValue: String
    public let serviceId: String
    public let title: String
    public let inputType: String
    public let questionType: String
    public let multipleSelect: String
    public let addons: [Addon]?
    public let values: [QuestionByValueValue]?
}

public struct QuestionByValueMapper: Mapper {
    public typealias I = QuestionByValueDto
    public typealias O = QuestionByValue

    public init() {}

    public func map(_ input: QuestionByValueDto) -> QuestionByValue {
        QuestionByValue(id: input.id,
                parentValue: input.parentValue,
                serviceId: input.serviceId,
                title: input.title,
                inputType: input.inputType,
                questionType: input.questionType,
                multipleSelect: input.multipleSelect,
                addons: NullableInputListMapper(AddonMapper()).map(input.addons),
                values: NullableInputListMapper(QuestionByValueValueMapper()).map(input.values)
        )
    }
}

// MARK: - Addon
public struct Addon {
    public let id: Int
    public let valueId: String
    public let questionId: String
    public let title: String
    public let inputType: String
    public let questionType: String
    public let multipleSelect: String
    public let values: [AddonValue]?
}

public struct AddonMapper: Mapper {
    public typealias I = AddonDto
    public typealias O = Addon

    public init() {}

    public func map(_ input: AddonDto) -> Addon {
        Addon(id: input.id,
                valueId: input.valueId,
                questionId: input.questionId,
                title: input.title,
                inputType: input.inputType,
                questionType: input.questionType,
                multipleSelect: input.multipleSelect,
                values: NullableInputListMapper(AddonValueMapper()).map(input.values)
        )
    }
}

// MARK: - AddonValue
public struct AddonValue {
    public let id: Int
    public let addonId: String
    public let value: String
    public let quantity: String
    public let fixedPrice: String
    public let pricePerHour: String
}

public struct AddonValueMapper: Mapper {
    public typealias I = AddonValueDto
    public typealias O = AddonValue

    public init() {}

    public func map(_ input: AddonValueDto) -> AddonValue {
        AddonValue(id: input.id,
                addonId: input.addonId,
                value: input.value,
                quantity: input.quantity,
                fixedPrice: input.fixedPrice,
                pricePerHour: input.pricePerHour)
    }
}

// MARK: - QuestionByValueValue
public struct QuestionByValueValue {
    public let id: Int
    public let questionId: String
    public let value: String
    public let quantity: String
    public let fixedPrice: String
    public let pricePerHour: String
}

public struct QuestionByValueValueMapper: Mapper {
    public typealias I = QuestionByValueValueDto
    public typealias O = QuestionByValueValue

    public init() {}

    public func map(_ input: QuestionByValueValueDto) -> QuestionByValueValue {
        QuestionByValueValue(id: input.id,
                questionId: input.questionId,
                value: input.value,
                quantity: input.quantity,
                fixedPrice: input.fixedPrice,
                pricePerHour: input.pricePerHour)
    }
}