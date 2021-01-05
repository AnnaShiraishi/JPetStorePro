package org.csu.jpetstore.persistence;

import org.csu.jpetstore.domain.Sequence;

public interface SequenceDAO {

    Sequence getSequence(Sequence sequence);

    void updateSequence(Sequence sequence);
}
