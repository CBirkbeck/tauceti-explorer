# PAPER-BURUNGALE-TIAN-26 — extraction and routing

Agent: Codex. Session: codex-a71f92. Issue: #1048. Status: complete extraction, pending independent review.

## Outcome and scope

The result contains **90 items: 3 library, 44 planned and 43 missing**. All 43 missing items have exactly one route. Six source routes attach precise additional inputs to existing proposed roadmaps; two Part II routes add the genuinely new CM main-conjecture and converse layers. No upstream roadmap is re-planned and no implementation or closed blueprint is claimed.

Burungale–Tian prove a rank-zero p-converse for CM elliptic curves over their imaginary quadratic CM field, and over Q when they descend, for **every prime**, including 2 and 3. Their proof passes through the rational equivariant elliptic-unit main conjecture, Kato's rational main conjecture for CM newforms, and an even-weight Bloch–Kato Selmer-vanishing converse. Applications give analytic rank zero for almost all positive squarefree congruent-number twists in the even-parity classes, and for at least half of a specified CM twist family over K when 3 is not inert.

“Complete” refers to extracting and routing this paper, not recursively finishing its prerequisite literature. Every named theorem, construction and non-routine proof interface used for these conclusions appears in the item inventory. Multi-part conclusions, the dyadic contained-field descent, conjugation sign, conjugate-dual convention and the two statistical inputs are separate items.

## Source identity and reading boundary

The complete source read is [arXiv:2506.03465v2](https://arxiv.org/pdf/2506.03465v2), dated 11 October 2025, seven pages including all 24 references. Its SHA-256 is
`cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.
All item page locators refer to this author version.

The [publisher record](https://annals.math.princeton.edu/2026/203-1/p01) identifies Ashay A. Burungale and Ye Tian, *Annals of Mathematics* 203 (2026), no. 1, 1–13, DOI 10.4007/annals.2026.203.1.1. Title, authors and both abstract conclusions match; the author revision followed the recorded acceptance date by one day. The typeset 13-page article was **not** available for line-by-line comparison. The JSON records this limitation rather than claiming that pagination was read.

Selected supporting passages were also read, not their complete papers:

- [Kato, Astérisque 295](https://www.numdam.org/article/AST_2004__295__117_0.pdf): §§8.2–8.3, 12.3–12.8, 14.9–14.10 and the relevant §§15.5–15.18 comparisons. The period formula on printed p.221 was checked visually against the PDF, including f*, the sign and the power of 2πi.
- [Johnson-Leung–Kings](https://arxiv.org/pdf/0804.2828v2): end of §7.1, all of §7.2 and the beginning of §7.3, to distinguish regular height-one primes from the additional singular-prime hypothesis.
- [Bhargava–Klagsbrun–Lemke Oliver–Shnidman](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf): §§1–2, Lemma 9.1, §§9.1–9.2 and §11 through the proof of Theorem 2.7.
- [Smith I](https://arxiv.org/pdf/2207.05674v2): introduction through Remark 1.6, including the curve hypothesis, signed-integer ordering, corank convention and dependence on Part II.

The JSON records hashes, URLs and the precise read sections of each downloaded source. All were accessed on 21 September 2026. Rubin, Huber–Kings, Smith II and Birch–Stephens are explicitly prerequisite papers; their complete proofs were not read or silently marked covered.

## Why these routes

| Route | Owner | Items / missing | Decision |
| --- | --- | ---: | --- |
| 1 | KatoEulerSystems L2–L4 | 10 / 1 | Reuse actual zeta classes, signs, reciprocity and Euler-system results. Add the precise rational H¹ rank-one freeness theorem to L4; do not put the reverse main-conjecture divisibility here. |
| 2 | SelmerIwasawaCohomology L0/L2/L3/L4 | 8 / 1 | Keep general cohomology, local conditions and specialization with their owner. Add the general classical Kummer/Bloch–Kato rational comparison once, not a private CM replacement. |
| 3 | ArithmeticStatistics ST.0/ST.5 | 5 / 4 | Add the exact squareclass height, squarefree half-density calculation, Smith corank input and BKLOS corank input. Broad existing statistical scope is not evidence that these exact theorems were already planned. |
| 4 | IntegralIwasawaTheory I.1/I.2 | 5 / 0 | The paper is an additional source for cyclotomic arithmetic towers and norm-compatible unit/class modules. Their arithmetic carriers do not migrate into a second generic Selmer owner. |
| 5 | RankZeroOneBSD BSD.0 | 2 / 2 | Supply the concrete congruent-number model and its root-number calculation inside the existing analytic/twist setup. |
| 6 | ComplexMultiplicationAndExplicitReciprocity CM.1/CM.4 | 2 / 2 | Supply arbitrary-order elliptic CM L-factorization and the rational CM self-twist isogeny, using existing ideal actions and characters. |
| 7 | CMAllPrimeMainConjectures, Part II of ModularIwasawaMainConjectures | 16 / 16 | Add the actual two-variable elliptic-unit theory, rational horizontal-prime equality, CM zeta comparison and all-prime descent to Kato's equality. |
| 8 | CMRankZeroConverse, Part II of RankZeroOneBSD | 17 / 17 | Add the Selmer-to-analytic implication and its elliptic, descent and density applications; the parent supplies the opposite implication and its common setup. |

The Part II titles use their parents' exact titles, and each parent is the first prerequisite. Both briefs state endpoints with hypotheses, distinguish imports from new work, prescribe the proof interfaces and specify tests for subsequent design/blueprint jobs.

The ordinary and family branches in ModularIwasawaMainConjectures do not supply the unconditional all-prime CM equality. IntegralIwasawaTheory's totally-real determinant results and the scoped noncommutative/equivariant branches likewise are not the imaginary-quadratic elliptic-unit theorem. The existing rank-one-converse design is adjacent work, not a supplier of this rank-zero result.

The directions are existing foundations → CMAllPrimeMainConjectures → CMRankZeroConverse. The first extension does not depend on the converse, and the generic source additions do not require the new converse branch. No atlas edge is edited by this paper extraction.

## Library and ownership checks

The extraction uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The three library items are the cyclotomic character, module localization and the bundled normalized newform. Their statements were read and local file hashes matched the raw files at the full pinned commits. The JSON records the declaration names and evidence.

A bundled newform does not supply its unbuilt coefficient field or Galois representation. The concrete finite 2-descent Selmer group does not supply p∞-Selmer or Bloch–Kato cohomology. A trace/norm quadratic-twist carrier does not by itself supply the squareclass/model dictionary. The special maximal-order, class-number-one CM regulator example does not supply an arbitrary-order CM elliptic comparison.

Reviewed coverage entries and the relevant roadmap stage descriptions were read before assigning statuses. The screen included the 25 link-packet entries, two overlap entries and 236 recorded atlas edges touching the seven core owners. The overlaps confirm a single upstream discrete-Selmer carrier and analytic BSD statement. The surrounding CM, Galois duality, modular representation, regulator, class-field, measure/Iwasawa and statistics suppliers are named at their actual scope.

## Mathematical checks that matter

1. **Rational means rational.** Invert p before using the CM characteristic-ideal equality. Johnson-Leung–Kings §7.2 controls primes not containing p; it does not dispose of the integral singular-prime μ condition. Keep finite torsion factors in the Galois group, especially at p=2.
2. **Descent is not substitution in a divisor identity.** Keep Kato's H²[a] term and prove the control comparison. Treat K contained in the cyclotomic tower separately; K=Q(i), p=2 is essential to the congruent-number application.
3. **Fix the representation convention.** Use Kato's cohomological realization, j_* étale extension, conjugate-dual relation, half-weight twist and sign. The explicit reciprocity formula first involves f* and the p-omitted L-value; the full central L-value needs the stated comparisons.
4. **Do not literalize the compressed elliptic display.** The author version's p.6 comparison suppresses Tate-twist, coefficient-completion and duality information. The extraction states the vanishing consequence actually used. The design must prove the typed Kummer/Bloch–Kato, CM decomposition and Shapiro comparison; no canonical self-duality of an arbitrary vector space is assumed.
5. **Keep the statistical hypotheses and ordering.** Smith's input concerns 2∞-corank, not finite 2-Selmer rank. Its restricted positive squarefree formulation needs the curve hypothesis and parity/local-family comparison. BKLOS's headline Mordell–Weil-rank theorem is insufficient alone: its proof supplies the stronger Selmer input through the CM 3-isogeny, average bound and parity. No finite-Sha hypothesis is introduced.
6. **Do not overstate the applications.** “At least half” is a lower-density conclusion in the specified K-squareclass height. The congruent-number theorem does not prove the odd-parity analytic-rank-one half of Goldfeld. The cube-sum example is a family of CM elliptic curves over Q(ζ₃), not a density theorem for rational cube-sum integers.

## Validation and review handoff

The repository paper checker passes. Additional scratch checks verify counts, unique missing-item routing, existing stage references, exact Part II parent titles/first prerequisites, new-id uniqueness, source hashes and absence of private machine paths. No suggested Lean file is required by this paper job; no Lean compilation or formalization is claimed.

Independent review should particularly test the source's compressed elliptic comparison, the regular-prime-to-rational equality, the contained-field dyadic descent, and the exact stronger statistical inputs. The JSON includes their proof obligations and prerequisite sources so a design job cannot treat an abbreviated citation as an already-built theorem.
