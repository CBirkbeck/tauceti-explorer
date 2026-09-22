# Mistakes in Witaszek, *Keel's base point free theorem and quotients in mixed characteristic*

Job ERRATA-PAPER-WITASZEK-22. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-WITASZEK-22.json` beside this file.

**Paper and version read.** Jakub Witaszek, Annals of Mathematics 195 (2022), 655–705, DOI 10.4007/annals.2022.195.2.4.
- **Read:** arXiv 2002.11915v2 of 23 January 2022 (SHA-256 `5ab79212…a842`), the accepted author version and the one the extraction used. Every passage below was re-read there.
- **Not collated:** the 51-page published text; its public deposit timed out.

**Earlier work.** The extraction PAPER-WITASZEK-22 (partial) found all four. Its other diagnostics concern cited sources and belong to them:
- Cascini–Tanaka's own later correction;
- Keeler's 2018 corrigendum, which the paper cites;
- the form of Keel's Lemma 5.2;
- a weak-normalization versus seminormalization question in an early Kollár preprint.

Witaszek's own uses of these supply the stronger inputs needed.

**Existing corrections.** None was found:
- Crossref registers no erratum;
- v2 is the latest arXiv version;
- the author's list and a web search found nothing.

**Effect.** None of these affects the main theorems. They are a missing hypothesis in Lemma 2.1, an overstatement in Lemma 6.8, a reversed inequality in a definition, and a missing word in the introduction.

## E1. "Perfect" is missing in the introduction (misprint)

After Corollary 1.3 the introduction says: "When the residue fields of S are not locally finite, we prove that L is EWM." Corollary 6.7 proves the EWM statement for perfect residue fields.

## E2. Lemma 2.1 needs f surjective (error)

The lemma says that for a finite map f : X → Y of integral proper schemes, L is big if and only if f*L is. The proof uses (f*L)^{dim X} = (deg f) L^{dim Y}, which needs dim X = dim Y.

For X a closed point of Y = P¹ and L = O, f*L is big but L is not. The lemma is used only for components surjecting onto their image (Proposition 5.2), where the corrected statement applies.

## E3. The contraction inequality is reversed (misprint)

The definition of EWM calls V contracted when "dim V < dim f(V)", which never holds. It should read dim f(V) < dim V, as in Keel.

## E4. Lemma 6.8's scheme may be empty (error)

The lemma asserts that the conductor restricted to the generic fibre is "a geometrically connected zero-dimensional scheme". The proof bounds its degree by less than 2, so it is empty or a single point of degree one. It is empty when D_i is normal, and the empty scheme is not connected. "At most one point", which is all that is used next, is what the proof gives.
