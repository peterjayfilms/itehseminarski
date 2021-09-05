

import React from 'react'
import { Table } from 'semantic-ui-react'
import { Student } from '../model'


interface Props {
    studenti: Student[]
}

export default function StudentiTabela(props: Props) {
    return (
        <Table inverted>
            <Table.Header>
                <Table.Row>
                    <Table.HeaderCell>Ime</Table.HeaderCell>
                    <Table.HeaderCell>Prezime</Table.HeaderCell>
                    <Table.HeaderCell>Indeks</Table.HeaderCell>
                    <Table.HeaderCell>Email</Table.HeaderCell>
                </Table.Row>
            </Table.Header>
            <Table.Body>
                {
                    props.studenti.map(element => {
                        return (
                            <Table.Row key={element.id} >
                                <Table.Cell>{element.ime}</Table.Cell>
                                <Table.Cell>{element.prezime}</Table.Cell>
                                <Table.Cell>{element.brojIndeksa + '/' + element.godinaUpisa}</Table.Cell>
                                <Table.Cell>{element.email}</Table.Cell>
                            </Table.Row>
                        )
                    })
                }
            </Table.Body>
        </Table>
    )
}
