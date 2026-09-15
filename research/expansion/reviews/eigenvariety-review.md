# Independent review: eigenvariety machine packets

Reviewers: independent-review-R1 (PadicFamilies.json, terminated before writing this
file; its findings are recorded in that packet's `review` block, sources and gaps) and
independent-review-R1b (LocallyAnalyticDistributions.json, and this report).
Date: 2026-09-15. Both packets stay at status `partial`; both `review` blocks are
`accepted` for the scope each packet actually claims. Implementation status of every
node remains `unchecked`; nothing here is a Lean ticket.

## 1. PadicFamilies.json (scope L2a, generic eigenvariety construction)

Recorded outcome of R1's review: 14 nodes (13 original, 1 added), 24 links, 4 sources.
All 13 original nodes and 22 links were checked against Buzzard, *Eigenvarieties*
(author manuscript, 2 August 2006; SHA-256 `0c5424…f57d`, identical to the copy the
author's page still serves; no errata, no arXiv version) and Conrad, *Modular curves and
rigid-analytic spaces*, Appendix A.1. Six nodes verified unchanged; seven corrected in
place; one node added.

### Corrections R1 made in place

- `strict-slope-neighborhoods` (Lemma 4.5, pp. 28–30): statement, hypotheses, proof
  steps and acceptance rewritten with corrected inequalities (see below).
- `admissible-slope-cover` (Theorem 4.6, pp. 30–31): the induction hypothesis must
  include f_r^{-1}(X_α) ⊆ Y_α, which the printed H(i) omits.
- `slope-polynomials` (§5, pp. 34–35): the source invokes Theorem 3.3 without proving
  (Q,S)=1; a proof via the open-and-closed property and the resultant-unit criterion is
  supplied.
- `flat-eigenvariety-base-change` (Lemmas 5.4–5.5): admissibility of the pulled-back
  cover is justified by finite covers of each Z'_r rather than by separatedness alone.
- `linked-banach-families` (Lemma 5.6, p. 40): the text cites Lemma 2.13 where Lemma
  2.12 (the cyclic identity) is meant.
- `global-weight-gluing` (Construction 5.7): the printed display of the links α_ij is
  mis-indexed; the corrected typing M_{X_i} → M_{X_j} ⊗̂_{O(X_j)} O(X_i) and the cocycle
  condition are recorded.
- `eigenpacket-points` (Lemmas 5.9–5.10): both directions of the bijection are supplied
  and the implicit base change K → L is flagged.

### Lemma 4.5: printed errors confirmed, two further defects found

R1 rendered pp. 29–30 as images and confirmed the draft's claims: (1) the third family
of inequalities prints `(n−d)t` where `(n−d)log(t)` is established and used, in three
places; (2) the concluding identities are printed as `X ∩ W = ∅, X ∪ V = B` where the
definition of strict neighbourhood on p. 28 requires `V ∩ W = ∅, X ∪ W = B` (which do
hold). Two further defects, not in the draft: (3) the second family is printed for
0 < n < d, dropping the n = 0 condition `−log|r_d(x)| ≤ dγ1` that gives the uniform lower
bound for |r_d| on X; without it (or δ2 < dγ2) the constant-degree claim fails, with the
explicit counterexample P = 1 + uT on the closed unit disc, V = {|u| = 1}, r = 1, d = 1;
(4) the pieces of W of the form {|r_n| ≥ c|r_d|} need not be affinoid where r_n and r_d
have a common zero; intersecting with the Laurent domain {|r_d| ≥ e^{−δ2}} repairs this.
The pointwise sentence "no elements of norm s, hence Y is disconnected" is not
load-bearing (footnote 2, Grosse-Klönne). The CUP 2007 text was not obtained, so it is
unknown whether any of (1)–(4) was corrected in print.

### Sources acquired by R1, with provenance

- Chenevier, *Familles p-adiques de formes automorphes pour GL_n*, author copy
  glnfam.pdf (74 pp.), `http://gaetan.chenevier.perso.math.cnrs.fr/articles/glnfam.pdf`
  (plain http; the https host presents a mismatched certificate), SHA-256
  `eaba21cc…496d`, fetched 2026-09-15. Read: Théorème C summary, Lemme 6.2.10,
  Théorème 6.3.6 statement, §6.4.1, Proposition 6.4.2 with proof, Lemme 6.4.3,
  Corollaire 6.4.4. Basis of the added node `equidimensional-components`: the proof
  uses only that the Hecke image is a commutative subalgebra of End_A(N) for N finite
  projective over an equidimensional reduced affinoid, so it applies in Buzzard's
  generality; the component/Zariski-density clauses still import Conrad's component
  theory and Coleman–Mazur 1.3.11 (unread).
- Coleman–Mazur, *The eigencurve*, authors' 113-page preprint as captured by the
  Internet Archive on 31 October 2008 from Coleman's Berkeley page,
  `https://web.archive.org/web/20081031155820id_/http://math.berkeley.edu/~coleman/eigen/coleman-mazur.pdf`,
  SHA-256 `bf8e96f2…4a70`, fetched 2026-09-15 (live Berkeley and Harvard URLs return
  404). Read: §1.1, Lemma 1.3.10–Corollary 1.3.12, Chapter 7 opening and §7.1 with
  Theorem 7.1.1, §7.4 opening with Lemma 7.4.1, Proposition 7.4.5, statement of
  Theorem 7.5.1. Chapters 2–6 and the proofs in §§7.2–7.5 remain unread; the catalogue
  entry `R02_KI_ColemanMazur1998` was `source_selected_not_acquired` and can now be
  updated by the orchestrator.

### The AdicSpacesPartII:R2 partial-supplier question (orchestrator decision)

Corollary 4.3 imports Conrad Theorem A.1.2 (quasi-finite flat of constant degree ⇒
finite), whose proof needs Bosch–Lütkebohmert I Prop. 4.7 and §3.5 rig-points, II
Thm 5.2/Cor. 5.3 (flat and quasi-finite formal models) and the scheme Lemma A.1.4
(EGA IV_4 18.5.11(c)). R1's supplier assessment: no stage in `data/atlas.json`
supplies these in the needed generality. `AdicSpacesPartII:R2` constructs admissible
formal schemes, blow-ups and the generic-fibre functor but no flattening, quasi-finite
model or finiteness criterion; `AdicSpacesPartII:F0` restricts formal geometry to
Noetherian adic rings (excluding O_K for nondiscrete K); `AdicEtaleGeometry:A2`,
`ClassicalAdicEtaleCohomology:H1:henselian` and `SchemeAndStackFoundations:SF.1` are
the next-closest candidates. R1 kept the edge R2 → `constant-rank-finiteness` only as
an annotated partial-supplier edge and did not assert supply. **Decision needed:** keep
the annotated partial edge, drop it (policy forbids partial-supplier edges), or open a
new stage/gap owner for Bosch–Lütkebohmert formal-model finiteness.

### Open items in PadicFamilies (from the packet's gaps)

Formal-model finiteness (above); the CUP text for Lemma 4.5; the complete modular
eigencurve proof (Coleman–Mazur now on disk, mostly unread); the coherent eigenmodule
sheaf and nonflat specialisation (Coleman–Mazur §7.1's q-expansion pairing is the
modular instance and does not exist for the generic machine); dense classical points
and unitary classicality, which are not inferred from the eigenpacket classification.

## 2. LocallyAnalyticDistributions.json (scope L4: Fredholm/Riesz machine)

Reviewer R1b. Result: `review.status = accepted`; 13 nodes (9 verified, 4 corrected in
place, none added or removed); 19 links (17 original verified, 2 added); 3 sources
(Serre added with provenance); 4 gaps (one rewritten, one new). JSON validated; every
link endpoint exists; the link graph is acyclic; the three links in PadicFamilies.json
that consume this packet's nodes (`summand-fredholm-theory`, `finite-slope-summands`,
`cyclic-determinant-identity`) point at existing IDs. No private paths in the packet.

Sources read: Buzzard §2 (pp. 4–20) and §3 (pp. 20–25), SHA-256 re-verified; Coleman,
*P-adic Banach spaces and families of modular forms*, 93-page manuscript
(`https://math.uchicago.edu/~fcale/Files/Cole2.pdf`, SHA-256 `d4035d4c…b5bc`,
re-verified): §A1 definitions of I(A) and hypothesis M, Theorem A2.1 and Corollary
A2.1.1, Lemmas A3.5, A3.7, A3.8, Theorem A3.9, Lemma A4.1 with proof, Proposition A4.2,
the displayed Theorem A4.3 argument, Remarks A4.4, Theorem A4.5 statement.

### Serre 1962: obtained and read

Serre, *Endomorphismes complètement continus des espaces de Banach p-adiques*, Publ.
Math. IHÉS 12 (1962), 69–85. Numdam item
`http://www.numdam.org/item/PMIHES_1962__12__69_0/`, PDF
`http://www.numdam.org/item/PMIHES_1962__12__69_0.pdf` (18-page wrapper). The file
in the scratch directory had been fetched by R1 on 2026-09-15; R1b re-fetched it on
2026-09-15 (HTTP 200 after redirect to https) and obtained the identical SHA-256
`67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`. Read with proofs:
§1 (conventions, Propositions 1–2, Remarques 1–2), §5 (the reduction-mod-ideal
construction, Proposition 7 (a)–(d), Corollaires 1–3, Proposition 8, Lemme 2), §6
(Proposition 10, Lemme 3), §7 (Propositions 11–12, Corollaire). Not read: §§2–4, Prop.
9, §§8–9. Serre assumes only a non-trivial valuation for these results; discreteness
enters only in Propositions 1, 2, 5, 9, 13, 15, none used by Buzzard.

What transfers verbatim to Noetherian K-Banach algebras: the coefficient formula and
|c_m| ≤ r_1⋯r_m (Prop. 7 a, b), the finite-rank comparison (7 d), the uniform coefficient
bound |c_m^{(n)} − c_m| ≤ ε (Prop. 8, which is Buzzard's "uniformly in the coefficients"
in Lemma 2.5(a)), the recurrence v_m = c_m + u v_{m−1} and |v_m| ≤ r_1⋯r_m (Prop. 10,
Lemme 3), the resolvent identity (Prop. 11) and the divided-derivative construction of
the projectors p = e^h, q = (e+f)^h − e^h (Prop. 12). What does not transfer: Serre's
definition of the determinant by reduction modulo ideals of the valuation ring, and
the count dim N(a) = h, which uses Remarque 2 of §1 (finite-dimensional subspaces of
c(I) are complemented with quotient c(J)); this is exactly where Buzzard's Proposition
3.2 says "we now diverge", replacing it by compactness of the identity on N, Lemma 2.11
and a reduction-modulo-maximal-ideals argument, which R1b checked and spelled out.

### Corrections made in place

- `cyclic-determinant-identity`: Lemma 2.7 is printed for ONable modules; the packet's
  potentially-ONable statement is justified by Corollary 2.6 and now says so; the (Pr)
  case is the exercise Lemma 2.12.
- `projective-banach-modules`: the acceptance item "independence from a chosen
  complement" belonged to the next node; replaced by the two directions of the lifting
  characterization (the source sketches only the c_A(I) key point) and the unproved
  "finite projective ⇒ (Pr)".
- `fredholm-resolvent`: two hypotheses added. Forward direction: Coleman Theorem A3.9
  and Lemma A3.8 (11) are for orthonormizable modules and must be transported to (Pr)
  modules via φ ⊕ 0. Converse direction: Coleman's proof of Lemma A4.1 uses
  det(1−v)·det(1−w) = det((1−v)(1−w)) = 1 (Serre Cor. 1 to Prop. 7; Coleman Cor.
  A2.1.1, cited there as A2.2.1). **Buzzard's §2 never states or proves this product
  multiplicativity**, yet Lemma 3.1 is said to "go through unchanged". Recorded as a
  new gap with a sketched proof route (Lemma 2.3(c) + Lemma 2.5(a),(b), then φ ⊕ 0),
  explicitly not claimed as done.
- `riesz-root-projectors`: statement now carries the source's conclusion
  det(1−Tφ|N) = (1−a^{−1}T)^h and a ∈ A; proof steps rewritten from Serre's Prop. 12.
- Minor: hypotheses noting A ≠ 0 (p. 8), the undefined completed tensor product (BGR
  2.1.7) in Lemma 2.8, BGR 3.7.3/1–3 in Lemma 2.3(b), the Lang IV §8 input in Lemma
  A3.5, the unproved ingredients on pp. 19–20, and the explicit order-n-zero and
  Cayley–Hamilton steps in Theorem 3.3 (with Coleman's displayed A4.3 argument added as
  a source).

Links added: `fredholm-resolvent → finite-slope-summands` (Lemma 3.1 is applied to φ|_F
on p. 25) and `summand-fredholm-theory → riesz-root-projectors` (N inherits (Pr) and
P = P_N·P_F on p. 23).

### What remains open in the Fredholm packet

1. Product multiplicativity of Fredholm determinants for commuting compact operators
   on (Pr) modules (new gap; needed by Lemma 3.1's converse).
2. Transport of Coleman Theorem A3.9/Lemma A3.8 to (Pr) modules over Noetherian
   K-Banach algebras (gap updated; nothing contradictory found).
3. Bourbaki/BGR inputs behind Proposition 2.1, Lemmas 2.2, 2.3, 2.8 (gap updated with
   exact loci).
4. The exercises Lemmas 2.12–2.13, the unproved ingredients on pp. 19–20 and both
   directions of the (Pr) lifting characterization.
5. The rest of stage L4 (affinoid-valued distribution modules, compact semigroup
   operators) is not started; coverage of L0–L3 remains `not_read`.

## 3. Items for the orchestrator

- Decide the AdicSpacesPartII:R2 partial-supplier edge (Section 1).
- Update the catalogue entry for Coleman–Mazur 1998 with the Internet Archive
  provenance recorded in PadicFamilies.json.
- Consider obtaining the CUP 2007 text of Buzzard's *Eigenvarieties* to check whether
  the Lemma 4.5 defects were corrected in print.
- Serre 1962 could be added to the reference catalogue with the provenance above.
