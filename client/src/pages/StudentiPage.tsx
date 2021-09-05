import axios from 'axios'
import React, { useEffect, useState } from 'react'
import { Grid, Header, Input } from 'semantic-ui-react'
import StudentiTabela from '../components/StudentiTabela'
import { Student } from '../model'
import { SERVER_URL, setFormState } from '../util'

export default function StudentiPage() {

    const [studenti, setStudenti] = useState<Student[]>([])
    const [search, setSearch] = useState('');
    useEffect(() => {
        axios.get(SERVER_URL + '/student', { withCredentials: true }).then(res => {
            setStudenti(res.data);
        })
    }, [])

    return (
        <Grid style={{ paddingTop: '70px' }} padded columns='16'>
            <Grid.Row centered>
                <Grid.Column width='7'>
                    <Header >
                        Spisak studentata
                    </Header>
                    <Input value={search} onChange={setFormState(setSearch)} fluid placeholder='Pretrazi...' />
                </Grid.Column>
            </Grid.Row>
            <Grid.Row>
                <Grid.Column width='16'>
                    <StudentiTabela studenti={studenti.filter(element => {
                        return element.ime.startsWith(search) || element.prezime.startsWith(search) || element.brojIndeksa === Number(search) || element.godinaUpisa === Number(search) || element.email.startsWith(search)
                    })} />
                </Grid.Column>
            </Grid.Row>
        </Grid>
    )
}
