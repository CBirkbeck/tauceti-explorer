# Mistakes in Ciubotaru–Harris, generalized Ramanujan and Arthur conjectures

Original errata job: Claude Code, session `cc-fb70e5`, 22 September 2026. Independent review REV-ERRATA-PAPER-CIUBOTARU-HARRIS-26: Codex, session `codex-hjdg0j`, 23 September 2026. **Five findings confirmed in arXiv v1**, including two added by this review. Verdicts are in the JSON beside this report.

## Version boundary

Read [arXiv 2311.15300v1](https://arxiv.org/pdf/2311.15300v1), 26 November 2023, SHA-256 `7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103`. The [Annals article](https://annals.math.princeton.edu/2026/204-2/p03), 204 (2026), 545–601, DOI 10.4007/annals.2026.204.2.3, lists revision 8 October 2025. Its full text was not obtained and may already correct these findings. “Confirmed” here does not certify the journal's wording.

No later arXiv version or separate correction was found in the 23 September 2026 search of the journal, Crossref, author publication pages and Oxford repository record. The latter provided bibliographic metadata but no downloadable manuscript; Harris links the same arXiv version. Full provenance and limits are in the review.

## E1–E3: the inherited findings

| Finding | Preprint locator | Confirmed correction |
| --- | --- | --- |
| E1 | Theorem 1.11 and preceding paragraph, p.5 | Refer to Conjectures 9.1 and **9.5**. On p.31, (9.3) is a display; Conjecture 9.5 supplies its decomposition and compatibility. |
| E2 | Theorem 8.5 proof, symplectic case (2), p.29 | Replace odd by **even** in the condition on j. Odd Jordan sizes yield symplectic multiplicity factors already eliminated; even sizes yield the orthogonal factors in the statement. Remark 8.6 uses j=2, r₂=3. |
| E3 | Theorem 10.3 proof, p.34 | The rightmost subscript in the three listed F₄, E₇ and E₈ comparisons is **u**, not v. |

These are misprints. E3 requires a qualification missing from the original report: the F₄ numbers also require the coordinate correction E5. Fixing the subscript alone does not reconcile that part of the proof with the printed Theorem 8.5 parameter.

For the intended parameters, root enumeration gives these pairs (n_u,n_v): F₄ at weights 10,9,8: (1,1),(0,0),(1,2); E₇ at 10,9: (1,1),(0,1); E₈ at 18,17,16: (1,1),(0,0),(1,2). Higher positive weights vanish. These are the comparisons used to contradict Property A. They do not prove the full unitary classification.

## E4: graded dimensions labelled as filtration dimensions

Definition 2.2, p.6, explicitly uses an increasing filtration. Nevertheless the appendix Tables 2–4, pp.35–37, label nonmonotone lists as dim Fil_i. For example the principal F₄ row starts 4,0,4. The lists must describe dim gr_i, equivalently h-weight multiplicities, rather than dimensions of nested subspaces. Exact root enumeration reproduces the full principal F₄, E₈ and G₂ rows as graded dimensions; including negative weights gives dimensions 52,248,14. For F₄ the actual cumulative dim Fil₀ is 28.

The same notation slip occurs in the half-spin argument on p.35. A nonzero exhaustive increasing filtration has no maximum index with Fil_i nonzero; the stated highest-weight formula concerns gr_i instead. Use graded dimensions in these computations and table labels. Lemma 10.9's hypothesis can stay in filtration language because equality of filtration dimensions is equivalent to equality of the successive differences. This is a harmless notation repair to the intended argument, not a certification of every exceptional row. It resolves the convention question left open by the extraction.

## E5: extra ω₂ in the F₄, B₃ parameter

Theorem 8.5(3), p.29, lists ω₁+ω₂+½ω₃+½ω₄. The fundamental weights printed in (6.21), p.22, convert this to (4,3/2,1,1/2), whose squared norm is 39/2.

The cited primary classification, [Ciubotaru, *The unitary I-spherical dual for split p-adic groups of type F₄*](https://www.math.utah.edu/~ptrapa/math-library/ciubotaru/ciubotaru_F4.pdf), manuscript §2.6 p.10 and B₃ rows pp.14,37, uses exactly the same coordinates and gives

s(ν)=(3/2+ν,−3/2+ν,3/2,1/2), 0≤ν<1.

Its squared norm is 7+2ν²<9. Weyl transformations preserve that norm, excluding the printed point from the claimed complementary series. The nonzero half-integral parameter is ν=1/2: the root pairing with ε₁+ε₃ forces 2ν integral, and this value also gives half-integrality for all weights (F₄ has equal root and weight lattices). Its vector (2,−1,3/2,1/2) is conjugate by a signed permutation to (2,3/2,1,1/2), then by reflection in (1,−1,−1,−1) to (5/2,1,1/2,0).

Thus the corrected entry is **ω₁+½ω₃+½ω₄**, deleting ω₂. Its adjoint Frobenius weights have maximum 10 and multiplicities 1,0,2 at 10,9,8, matching the later proof. The printed parameter instead has maximum 16, as is already seen from the root 2ε₁. Record this as an error affecting a stated coordinate classification, with the explicit repair. This does not assert failure of the intended global theorem or persistence of the error in the journal revision.
