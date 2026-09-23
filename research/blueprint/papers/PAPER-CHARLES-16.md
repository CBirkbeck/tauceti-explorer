# PAPER-CHARLES-16 — current independent-review state

**Partial; independent review: revise (Codex — codex-7e92bd, 23 September 2026).** The endpoint inventory has 173 items: 16 library,17 planned,140 missing, each missing item routed exactly once. Four source routes (5,6,8,9) are accepted; routes1–4 and7 require revision. See [the independent review](../reviews/REV-PAPER-CHARLES-16.md) for the source evidence and precise obligations.

The prior completeness claim is withdrawn. Supplier proofs remain undecomposed; the characteristic-two birationality step is reopened, and the final partner nonsuperspeciality and integral twisted comparison remain unverified. Definition APIs/tests also need revision. The current JSON governs over historical progress notes below.

Clear corrections made by the review include the deformation-ideal factor in item74, the rational/integral norm restriction in item95, the full-space eigenvalue condition in item113, the finite-type scope in item58, and a single-owner split of rational Tate descent from K3 integral saturation. Items6/7 are on p.492. The broader briefs now coordinate the shared K3/orthogonal and field period/index proposals.

The source register now has **25 reviewed findings:24 confirmed, E15 rejected**. E15 treated an imported fixed-determinant definition as a gap; its separate citation typo is E23. New findings E22–E25 record the obstruction coefficient, two cross-reference slips and the failed rational-Chow inclusion for arbitrary ℓ-adic B-fields. The latter is distinct from Charles’s integral-preimage error and does not refute his integral-norm application. Every finding carries its independent reason and fresh correction searches in the JSON.

The paper checker,139 independent arithmetic/symbolic assertions and the inherited154556-assertion arithmetic certificate pass. These are structural/arithmetic checks, not a proof of the geometric endpoints; no Lean compilation is claimed.

## Historical extraction reports (superseded where inconsistent with the review)

# Charles (2016): extraction and routing

Issue [#1188](https://github.com/CBirkbeck/tauceti-explorer/issues/1188). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged checkpoints of Codex (codex-c83e7a and earlier) and of cc-fb70e5, whose reports follow below as history.
- **The paper.** F. Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin's trick for K3 surfaces, and the Tate conjecture*, Ann. of Math. 184 (2016), 487–526. The published PDF was read in full (SHA-256 3425f269…).
- **Items.** The result has **173 items: 16 library, 17 planned and 140 missing**. Every missing item is routed exactly once; the two items the checkpoint left unrouted (113 and 127) are now routed.
- **Mistakes.** Twenty-one are recorded under `sourceIssues`. E10–E12 concern the cited Lieblich–Maulik–Snowden paper.

## This continuation (cc-442dc5)

**What was read.** The whole published paper, pp. 487–526, with every proof in §§2–4 followed. Lieblich–Maulik–Snowden (arXiv 1107.1221v5) was read at the locators of E10–E12 and E14–E16.

**Checks of the checkpoint's findings.** All seventeen were confirmed at their locators. Among them:
- **E1:** Corollary 2.8's λ = div(v)²/v² is not an integer in general; v = (1, 0, −1) gives λ = 1/2.
- **E2:** the Gram matrix diag(8, 8) in ⟨2⟩ ⊕ U has no totally singular plane modulo 2, so it has no primitive embedding.
- **E3:** 3r − 4 > r fails at r = 2.
- **E12:** the counterexample diag(1, −1) with Gram matrix [[ℓ^m, 1], [1, 0]] was recomputed.
- **The partner identities.** h_n·v_n = 0, h_n² = 2dℓ^{2n} and v_n² = 0 were recomputed. Lemma 4.2 was checked.

**Lemma 4.5 (E8, items 113 and cayley-discriminant).**
- **The problem.** The proof passes from ℓ-adic valuations of disc T(X, Z_ℓ) to "finitely many primes p_i". The ℓ-adic discriminants live in different groups Q_ℓ^×/Q_ℓ^×², so valuations cannot compare them.
- **The repair.** Assume Frobenius is semisimple on the eigenvalue-1 part (item 111) and −1 is not an eigenvalue. Let g be the characteristic polynomial on the complement V′ of the invariants.
  - The Cayley transform (F−1)(F+1)⁻¹ is skew-adjoint and invertible on V′. So det V′ ≡ g(1)g(−1) modulo squares.
  - With det H² ≡ −1, this gives disc T(X, Q_ℓ) ≡ −g(1)g(−1)·disc NS(X), a rational number independent of ℓ.
  - For large ℓ the projector g(F)/g(1) is integral, so T(X, Z_ℓ) is unimodular. Then the rank-one case needs −1 and the primes of that number to be squares modulo ℓ.
- **What changes.** Item 113 now states the lemma in this form, after a finite extension of k and with −1 added to the p_i.
  - The extension is needed: the determinant of a (−1)-eigenspace is not determined by g.
  - It is harmless, because the Tate statement descends. So E8 still affects only the proof.
- **The checkpoint's substitute is kept.** Its split-prime version (items 114 and simultaneous-k3-norm) remains as an alternative.

**The partners' hypotheses (E21, item 127).**
- **The gap.** Proposition 3.17 counts polarized *nonsuperspecial* surfaces, and its proof needs this through Proposition 3.10's smooth 19-dimensional deformation space. The proof of Theorem 1.3 reduces X to the nonsuperspecial case but applies Proposition 3.17 to the partners X_n = M_{H_n}(v_n), whose nonsuperspeciality is not shown.
- **Ampleness.** The paper's sketch of the ampleness of H_n is completed by item 128, given the family; building the family is a supplier step.
- **Classification.** Theorem 1.3 has other proofs, so the finding affects the proof.

**New misprints**, all at their locators:
- **E18:** "(2n)!" for "(2d)!" in the proof of Proposition 2.9, p. 501. The condition must make m prime to y₀ ∈ [1, 2d].
- **E19:** "A_{2nd}" for "A_{2md}", p. 501.
- **E20:** "v² = n − 2" for "v² = 2" in the proof of Proposition 3.17, p. 517. Here dim M_H(v) = 4.

**Coverage.** Remark 3.9 (low-degree Hodge–de Rham degeneration and h^{2,0} = 1 for admissible triples) was the one numbered statement without an item; it is now item 143.

**Why the status is now complete.**
- Every numbered statement and every cited input is an item.
- Every missing item is routed exactly once, and the mistakes are recorded, including a gap in the paper (E21) that the extraction cannot close.
- What remains is suppliers' proofs: the characteristic 2 and 3 audit (G3), Nikulin (G5) and the prerequisite interiors (G6).

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Corollary 2.8 and its proof, pp.499–500, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "If p > 0, we can find nonnegative integers λ and t such that 0 < λ ≤ v² and |disc(NS(X))| = p^t λ |disc(NS(M_H(v)))|." Proof: "… we have a natural injection of lattices with torsion cokernel Zv ⊕ (v^⊥ ∩ N(X)) ↪ N(X). Since the discriminant of Zv ⊕ v^⊥ is v² disc(v^⊥ ∩ N(X)), this implies by the same argument that |disc(N(X))| ≤ v² |disc(v^⊥ ∩ N(X))|." *Correction:* λ need not be an integer. With I = [N(X) : Zv ⊕ (v^⊥ ∩ N(X))], one has |disc NS(X)| = p^t (v²/I²) |disc NS(M_H(v))| with t ≥ 0. So λ = v²/I² is a positive rational number with λ ≤ v², and I divides v² because v is primitive. For p ∤ v², for example v² = 2 and p ≥ 3 as in the applications, λ is still a p-adic unit, which is what the later arguments use.
- **E2** (error; affects a stated result), Proposition 2.9, p.500, as used in the proof of Theorem 2.10, p.503, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "Proposition 2.9. Let d be a positive integer, and let Λ be a rank 2 positive definite sublattice of Λ_2d. There exists a positive integer N and nonzero integers a, b such that if m is any positive integer satisfying (i) m = 1[N]; (ii) m is prime to a and b, and both a and b are quadratic residues modulo m; then there exists a primitive embedding of Λ into Λ_2md." Proof: "In the setting of the proposition, the primitive embedding of Λ into Λ_2d corresponds to a tuple (V, W, γ, t)." *Correction:* Assume Λ is a primitive sublattice of Λ_2d. In the proof of Theorem 2.10, choose the lattice Λ containing v, w with v² = 2, v·w = 1 to be primitive. For example, in Λ_2d = ⟨2d⟩ ⊕ U with basis h, e, f, take the span of v = e + f and w = kh + e. It is primitive, since (x, y, z) ↦ (z, y − z) retracts it, and its Gram matrix [[2, 1], [1, 2dk²]] is positive definite.
- **E3** (gap; affects the proof), Proof of Proposition 3.1, p.506, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "By Riemann-Roch, for any p and q as above, the morphism H⁰(C, 3L|_C) → 3L|_C/(3L|_C − D(p) − D(q)) is surjective. Indeed, the degree of 3L|_C − D(p) − D(q) is 3r − 4 > r = deg(ω_{C/k}); note that r is even, so that r > 1." *Correction:* Pass to 2L before this step, as the proof already allows ("up to replacing L by 2L"), so that r = L² ≥ 4 and 3r − 4 > r holds.
- **E4** (misprint; affects nothing), Proof of Proposition 3.16, p.516, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "Fix some integer n ≤ 3. After replacing k by a finite extension whose degree only depends on n and Λ_l so that spin structures are defined … together with a level n structure." *Correction:* "Fix some integer n ≥ 3", prime to p, as in the Kuga–Satake setup on p.513 ("Let n ≥ 3 be an integer prime to p").
- **E5** (error; affects a stated result), Proposition 3.17, p.517, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "Then there exist a positive integer N and nonzero integers a, b such that there exist only finitely many polarized nonsuperspecial K3 surfaces (X, H) of degree 2md over k, where m is a positive integer satisfying (i) m = 1[N]; (ii) m is prime to a and b, and both a and b are quadratic residues modulo m; (iii) the p-adic valuation of the discriminant of NS(X_k̄) is at most t_0." *Correction:* There are only finitely many k-isomorphism classes of nonsuperspecial K3 surfaces X over k admitting a polarization H of such a degree 2md with (i)–(iii). The polarized pairs themselves need not be finite in number.
- **E6** (error; affects nothing), §4.1, the definition of N_{α/r}(X) and (4.1), pp.518–519, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "Let N_{α/r}(X) be the preimage of N(X) by T_{−α/r}. This is the group denoted by CH_{α/r}(X, Z) in [LMS14]. By [LMS14, Lemma 3.3.3], we have (4.1) N_{α/r}(X) = {(ar, D + aα, cω) | a, c ∈ Z, D ∈ NS(X)}." *Correction:* Define N_{α/r}(X) directly as the lattice (4.1), the twisted Mukai lattice CH_{α/r}(X, Z) of [LMS14], and drop "the preimage of N(X) by T_{−α/r}".
- **E7** (misprint; affects nothing), Proof of Theorem 1.3, p.522, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2). *Printed:* "By equation (4.2), this shows that there exists a line bundle H_n on X_n with c_1(B)² = 2dℓ^{2n}." *Correction:* c_1(H_n)² = 2dℓ^{2n}.
- **E8** (gap; affects the proof), Charles Lemma 4.5, p. 521. *Printed:* only finitely many prime numbers *Correction:* Lemma 4.5 holds, with the argument below, after replacing k by a finite extension on which −1 is not a Frobenius eigenvalue on H²(X_k̄, Q_ℓ(1)), and with −1 added to the p_i; it needs Frobenius semisimple on the eigenvalue-1 part (item 111). Let g be the characteristic polynomial of Frobenius on the complement V′ of the invariants. The Cayley transform (F−1)(F+1)⁻¹ is skew-adjoint on V′, so det V′ ≡ g(1)g(−1) modulo squares. Hence disc T(X, Q_ℓ) ≡ −g(1)g(−1)·disc NS(X), a rational number independent of ℓ. The p_i are the primes dividing it. Item 113 states and proves this form.
- **E9** (misprint; affects the proof), Charles Proposition 3.1 proof, final display p. 506. *Printed:* degree r *Correction:* If the final line bundle is 4L with L²=r, its square is 16r and h⁰(4L)=8r+2 under the stated vanishing; incorporate preceding replacements as well. Item 50 retains the inherited repaired existential bounds.
- **E10** (misprint; affects the proof), LMS Lemma 3.5.1 proof, published p. 302 and arXiv v5 p. 15. *Printed:* (−1)^(d/2) *Correction:* With d=dim(V_λ), replace the block discriminant by (−1)^d. The theorem’s total exponent n/2 is correct.
- **E11** (error; affects the proof), LMS Lemma 3.5.2 proof, published p. 302 and arXiv v5 p. 16. *Printed:* any element of Z_l *Correction:* For the rank≥2 unimodular lattice argument assert representation of every unit. For the fixed nonzero rational target d discard its numerator and denominator primes first; d=0 is immediate.
- **E12** (error; affects a stated result), LMS Proposition 2.1.2, published pp. 287–288 and arXiv v5 p. 3. *Printed:* equipped with an endomorphism φ *Correction:* Add the pairing compatibility B(φx,φy)=q^w B(x,y) used in the orthogonality step. The K3 Frobenius application has precisely that compatibility.
- **E13** (misprint; affects the proof), Charles (3.4) and Lemma 3.12, p. 514. *Printed:* H²_cris(M0/W) *Correction:* Carry the Tate twist (1) and the primitive part orthogonal to L from (3.3) into the displayed crystalline embedding and its use in Lemma 3.12.
- **E14** (misprint; affects the proof), Charles §4.1 p. 519, gerbe convention; compare LMS §3.3 arXiv v5 p. 11. *Printed:* [α_n] *Correction:* With the exp(+α/r) twisted Mukai convention imported from LMS, use the gerbe class −[α_n], or reverse the B-field convention consistently throughout.
- **E15** (gap; affects the proof), Charles §4.1 p. 519, simple-sheaf moduli paragraph; LMS Definition 3.4.1 arXiv v5 p. 13. *Printed:* µ_r-gerbe *Correction:* Include a chosen determinant isomorphism in each moduli object, as in the cited LMS definition.
- **E16** (gap; affects the proof), Charles §4.1 p. 519, isotropic moduli assertion; LMS Proposition 3.4.2 proof arXiv v5 p. 13. *Printed:* rk(v) = r *Correction:* For the imported automatic-stability proof require r to be the order of the geometric Brauer class after algebraic closure. Primitive B-field numerator alone and arithmetic order alone do not establish this.
- **E17** (misprint; affects nothing), Charles p. 522, partner-pairing and Theorem 1.4 proof. *Printed:* −2d; on X *Correction:* The selected Mukai convention gives v_n·(0,D,0)=+2d. The positive-square divisor B_n obtained via (4.2) lies on X_n.
- **E18** (misprint; affects nothing), Proof of Proposition 2.9, p. 501, in the published version (Annals 184 (2016)). *Printed:* Assume also that m is prime to (2n)!. *Correction:* Assume also that m is prime to (2d)!.
- **E19** (misprint; affects nothing), Proof of Proposition 2.9, p. 501, in the published version. *Printed:* Let W′ be the image of W in A_{2nd}, *Correction:* Let W′ be the image of W in A_{2md},
- **E20** (misprint; affects nothing), Proof of Proposition 3.17, p. 517, in the published version. *Printed:* for some λ ≤ v² = n − 2 *Correction:* for some λ ≤ v² = 2
- **E21** (gap; affects the proof), Proof of Theorem 1.3, pp. 522–523, in the published version. *Printed:* We can assume that X is not superspecial. … By Proposition 3.17, there exist only finitely many K3 surfaces over k satisfying the condition above, *Correction:* Proposition 3.17 counts polarized nonsuperspecial surfaces, so it applies to (X_n, H_n) only when X_n is nonsuperspecial. The proof reduces X, not the partners X_n, to the nonsuperspecial case. It needs infinitely many admissible n with X_n nonsuperspecial, or a separate finiteness statement for superspecial partners.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Characteristic-two birational linear-series proof** (resolved). Resolved by cc-fb70e5 (item 50); E3 and E9 record the paper's slips.
- **G2, Valuation bounds do not provide rational square classes** (resolved). Item 113 now states Lemma 4.5 in corrected form, after a finite extension removing the eigenvalue −1 and with −1 among the p_i, and proves it from the rational discriminant −g(1)g(−1)·disc NS (cayley-discriminant). The paper's gap is recorded as E8.
- **G3, Complete the simultaneous split-prime replacement** (deferred). The p ≥ 5 prime choice is complete. What remains is to audit the supplier inputs (Frobenius semisimplicity, the pairing-compatible comparison and the Brauer inputs) in characteristics 2 and 3 for Theorem 1.4. These are cited suppliers' proofs.
- **G4, Final partner polarization and nonsuperspecial hypotheses** (recorded). Ampleness: item 128 completes the paper's sketch given the family; building the family is a supplier step. The nonsuperspecial hypothesis for the partners is a gap in the paper, recorded as E21; item 127 states what is needed.
- **G5, Primitive embedding interfaces resolved; deeper source proof leaves remain** (deferred). Nikulin's local genus and strong-approximation proofs are cited suppliers.
- **G6, Original prerequisite proofs and remaining declaration-sized decomposition** (deferred). The prerequisite interiors (Fontaine–Messing, Yoshioka, twisted moduli, IHS Torelli, special-endomorphism lifting) are cited suppliers' proofs.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique. Every missing item is routed exactly once, and there are no unrouted items. Every in-paper prerequisite names an existing item.
- **The Cayley formula.** For 272 random rational isometries without eigenvalues ±1 (Cayley transforms of random skew-adjoint maps in dimensions 2, 4 and 6), det G / (g(1)g(−1)) is a rational square. The arithmetic is exact.
- **Corrections.** Crossref registers no update to DOI 10.4007/annals.2016.184.2.4.

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check the corrected Lemma 4.5 (item 113) and the classification of E8.
- Check E21, the nonsuperspecial hypothesis for the partners.

## Checkpoint history (unchanged)

The reports of the earlier checkpoints follow as they were written. Where they say *partial*, or describe items 113 and 127 as unrouted, this continuation supersedes them.

## PAPER-CHARLES-16 — extraction and routing checkpoint

Codex, session `codex-c83e7a`, 23 September 2026. **Partial.** This continuation supplies the characteristic-at-least-five prime-selection composition, preserves all earlier item identifiers and cc-fb70e5’s item 50 repair, and keeps the remaining proof gates explicit. It does not independently review that repair.

The extraction has **171 items: 16 library, 17 planned and 138 missing**. There are nine routes, 45 definitions/constructions, 135 proposed API contracts and 135 proposed tests. Items 113 and 127 remain deliberately unrouted. No Lean file was requested or compiled.

### What the paper establishes

The arbitrary-field construction begins with a polarized K3 surface of degree 2md, with explicit congruence and quadratic-residue conditions on m. A primitive lattice construction gives a norm-two Mukai vector and a smooth four-dimensional moduli space with a line bundle of fixed positive top power. The ample-class, prime-to-n and Witt-lifting refinements are separate outputs. For complex irreducible holomorphic symplectic varieties, fixed dimension and positive top power give birational boundedness after replacing the line bundle. The stronger uniform claim for the original line bundle is not asserted. Over finite fields, the paper proves Tate for K3 surfaces in characteristic at least five and for Picard rank at least two in every characteristic. The extraction retains these source endpoints while identifying their unresolved proof dependencies.

### Sources and reading scope

- [Charles, published Annals article](https://annals.math.princeton.edu/2016/184-2/p04): all 40 published pages were read in the prior checkpoints. This continuation freshly reread pp. 506, 514 and 517–522. The PDF hash remains `3425f2697b3600f7920f1bdce67681339d06a20dfaf39ea4fdc2a0baebc940e2`.
- [Lieblich–Maulik–Snowden, arXiv 1107.1221](https://arxiv.org/abs/1107.1221): the prior full 20-page reading is retained; fresh pages 2–4 and 8–16. The arXiv v5 PDF hash is `66ee971cf9449a7e76ca9a1a2f7332b54ec86330476ba115b08ab7670baa22d5`. The [published version](https://www.numdam.org/articles/10.24033/asens.2215/) was separately acquired; only pp. 287–288 and 302 were read. The two versions’ reciprocal-discriminant and representation passages were also inspected as images.
- [Huybrechts author draft](https://www.math.uni-bonn.de/people/huybrech/K3Global.pdf): cover/copyright and pp. 12, 16–18 only, including Proposition 3.5 and Remark 3.7. Downloading the 449-page book is not a full reading. The author identifies it as a prepublication version; published corrections may differ.
- The previous selected Nikulin reading, its damaged OCR and unsuccessful local acquisition remain recorded. No fresh or complete Nikulin reading is claimed. The JSON preserves the prerequisite acquisition register and the new PDF provenance.

The new source searches covered the Annals article page, the Charles title with erratum/correction terms, the LMS published and arXiv versions, and an LMS correction search. No correction to the recorded passages was identified in those checks. This is not a claim that no correction exists. Seventeen `sourceIssues` now include all seven inherited errata entries; no new independent-review verdict is supplied.

### The prime-selection argument

First extend the finite field so that every geometric Néron–Severi class is defined, then make a quadratic extension. Choose D and the polarization constants N,a,b over the resulting field, before selecting the prime. Rational divisor Tate descends by pushing cycles forward and dividing by the extension degree in Q_l, so failure of Tate survives these extensions. This argument does not claim integral descent.

Take one finite Galois compositum containing all Frobenius eigenvalues, roots of −1, −D², the NS discriminant, 2,a,b, and the N-th roots of unity. Identity-class infinitude belongs to upstream Chebotarev Layer 10. Its completely split primes, outside one finite exceptional set, meet every condition at once. No intersection of unrelated infinite prime sets and no linear-disjointness assumption is used. Number Field Arithmetic Layer 5 supplies the canonical completions and degree ef; the resulting local degree one gives an embedding of the entire field into Q_l. The cyclotomic Frobenius formula is already in the pinned library.

For a diagonalizable isometry, the λ and λ⁻¹ eigenspaces pair perfectly. If each has dimension r, their block determinant is (−1)^r. Thus the fixed space of the squared isometry has determinant (−1)^(n/2) times the full determinant, where n is the complementary dimension. The full K3 pairing has square class −1: the complex lattice is unimodular of signature (3,19), and transporting this requires the explicitly requested pairing-compatible comparison. Unimodularity alone does not determine its square class.

At good primes the invariant lattice and NS pairing are unimodular. Inverting the NS Gram matrix gives an integral orthogonal decomposition. In rank at least two, a nondegenerate finite-field quadratic form represents each unit; one-coordinate Hensel lifting gives a primitive vector of the requested norm. In rank one, the square discriminant and square target solve the equation directly. Excluding numerator and denominator primes makes the nonzero target a unit. The assertion that a rank-two unimodular lattice represents every integral element is false: x²+y² over Z_3 cannot represent 3.

Unit norm makes the vector primitive in the geometric quotient, and division by l^n has exact order l^n there. The Kummer identification is a separate input. Unit square roots lift modulo every l^m, and l≡1 mod N implies l^(2n)≡1 mod N. The resulting composition addresses the p≥5 consumer. It does not prove the literal original-field Lemma 4.5, the characteristic 2/3 input audit, or the twisted-moduli deformation and nonsuperspecial conditions.

### Existing library and ownership boundaries

The fresh input snapshot is `d2c523acdfca6ac535548af713d6b117b8c934c9`, with 524 checked input hashes. Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Actual declaration statements and hypotheses were read before adding credit; nine fresh declaration records include exact source text and file hashes.

The full Chebotarev roadmap, Number Field Arithmetic Layer 5, GN.2/GN.3 and MC.0/MC.1/MC.2/MC.7 targets were read, along with the accepted relevant audits. The prior complete Integral Lattices and Hodge Structures readings are retained. Chebotarev Layer 10 is planned, not built; Layer 7 does not supply the needed splitting. The generic integral quadratic adapters stay in GN.2/GN.3, with field discriminants and finite-field quadratic existence imported. The exact early rational-Tate descent implication belongs to MC.7 and uses MC.0/MC.2 trace compatibility; it must not depend on the later K3 Tate endpoint.

The final refresh screened changed BKT20 statements and route reasons and new CG20/Mao–Wan–Zhang26 records for the prime-selection scope. General period geometry remains supplied by the existing Hodge/Shimura owners. No competing owner of the added arithmetic interfaces was found in that screen.

| Route | Owner | Missing items | Other source items |
| --- | --- | ---: | ---: |
| new | K3SurfacesAndSymplecticBoundedness | 94 | 0 |
| part-ii | AlgebraicModuliStableTwistedSheaves | 6 | 0 |
| part-ii | OrthogonalIntegralModelsAndKugaSatake | 8 | 0 |
| source | GeometryOfNumbersAndQuadraticArithmetic | 28 | 0 |
| source | AlgebraicModuliForArithmeticGeometry | 0 | 3 |
| source | ShimuraVarieties | 0 | 2 |
| source | MotivesAndAlgebraicCycles | 0 | 4 |
| source | SchemeAndStackFoundations | 0 | 4 |
| source | AbelianSchemesAndArithmeticModuli | 0 | 1 |

#### K3SurfacesAndSymplecticBoundedness

No atlas stage, new-roadmap definition, accepted packet or reservation plans K3 surfaces or IHS boundedness. K3BlochGroups concerns algebraic K₃, not surfaces. MC.7 owns the Tate/divisor theorem register but not this geometric proof development. The route imports, rather than duplicates, the shared foundations.

Construct the K3-specific geometry missing from the atlas and the proof architecture of Charles, Annals 184 (2016), pp.487–526. The exact geometric endpoints are Theorem 2.10: for every d>0, over any field, choose r,N>0 and nonzero a,b so that H²=2md with m≡1 mod N, gcd(m,ab)=1 and a,b squares modulo m produces a smooth four-dimensional stable-sheaf moduli space M and L with L⁴=r, q(L)>0, c₁(v) proportional to H and condition (C); include the specified prime-to-n ample class and W-lifting refinements. The complex endpoint is Theorem 3.3: fixed dimension 2n and positive top power r give uniform birational linear-series bounds after replacing L by L′ with the same top power, and hence a birationally bounded family. Do not claim uniformity for the original L, which the introduction asks as an open question.

Build numerical NS and its geometric/arithmetic distinction, the ℓ-adic/algebraic Mukai lattices, Mukai vectors and RR, lifting of at most ten divisor classes, stable-moduli smoothness, deformation to Hilbert schemes, the BB form with (2n)!q^n=n!2^n times top intersection, integral/étale θ maps and p-primary cokernel. Include the corrected discriminant formula p^(2a)(v²/I²), not an integer multiplier. Develop the IHS local/global period argument, finite monodromy index, bounded ample deformation representatives, algebraized period-covering families and codimension-two Picard transport. Supply the strong-admissibility, special-endomorphism and finite-NS arguments in p≥5, then corrected Proposition 3.17 for underlying surfaces, never infinitely varying polarized pairs.

The arithmetic branch builds the corrected LMS signed-gerbe B-field lattice, exact geometric Brauer order, isotropic moduli partners, v^⊥/Zv maps and discriminant growth. Export these geometric inputs to Algebraic cycles, pure and mixed motives (MotivesAndAlgebraicCycles:MC.7) for Charles Theorems 1.3 and 1.4: Tate for all K3 over finite fields in p≥5, and for Picard rank≥2 in every characteristic including two. The latter does not use Kuga–Satake. Withhold items113 and127 until their named gates are discharged. Item50 retains the inherited cc-fb70e5 repair; item119 imports Chebotarev Layer10. Remaining consumers retain their explicit geometric and characteristic restrictions.

Import Stable and twisted sheaf moduli (AlgebraicModuliStableTwistedSheaves) for the general moduli/gerbe construction; Complex Shimura varieties and canonical models, Part II (OrthogonalIntegralModelsAndKugaSatake) for KS and good-prime models; Geometry of numbers, quadratic forms and homogeneous arithmetic (GeometryOfNumbersAndQuadraticArithmetic:GN.2–GN.3) for the new embedding and finite-lattice theorems; existing Integral lattices (tauceti:Completed/IntegralLattices) and Hodge structures (tauceti:TauCetiRoadmap/HodgeStructures) only through their actual pinned APIs. Import Scheme, stack, cohomology and intersection foundations (SchemeAndStackFoundations:SF.5), Algebraic moduli and representability (AlgebraicModuliForArithmeticGeometry:R09.1–R09.6), Complex comparison (ComplexComparisonPartII:C5), Crystalline cohomology (CrystallineCohomology:CR.1–CR.4), Cohomology comparisons (CohomologyComparisons:CP.2,CP.5), and the exact small-weight supplier in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. No private duplicate cycles, crystals, moduli stacks or comparison maps. Use only the early divisor (1,1) leaf of MC.7 for Lemma 3.15, never its later K3 Tate endpoint: refine that broad stage into acyclic early/late leaves before blueprint closure. Every object needs API, three discriminating tests, and separate proof leaves for every unread cited theorem. Counterexamples 35,89,96 are regression tests, not atlas planets.
Prime selection imports Chebotarev Layer10 identity-class infinitude and NumberFieldArithmetic Layer5 canonical completions. Use one common finite Galois compositum after changing the finite base field. The corrected LMS unit-representation and reciprocal-discriminant proof feeds the p≥5 route. The original-field square-class claim and characteristic2/3 input audit remain separate gaps. Rational Tate descent is an early MC.7 implication, with MC.0/MC.2 trace suppliers, never the final K3 Tate theorem itself.

#### AlgebraicModuliStableTwistedSheaves

Existing R09.4–R09.6 constructs the shared representability and restricted elliptic/abelian stack foundation; no existing layer promises stable/twisted-sheaf moduli. These are additional layers in that owner's direction, not a new disconnected moduli theory.

Start with Algebraic moduli and representability for arithmetic geometry (AlgebraicModuliForArithmeticGeometry:R09.1–R09.6 and A0-extension) as first prerequisite. Its Hilbert/Quot spaces, boundedness, algebraic spaces, stackification and formal algebraization are imports, not new versions. Extend its restricted elliptic/abelian moduli scope by constructing Gieseker-stable torsion-free sheaves of positive rank on polarized smooth projective surfaces, stable and semistable parameter stacks, relative coarse schemes, and the projective moduli theorem in the precise Langer 2004 setting used by Charles Theorem 2.4. Spell out the Hilbert polynomial, boundedness, GIT quotient, flat-family descent and the difference between coarse moduli and a universal sheaf.

Build μ_r-gerbes, weight-one twisted sheaves, determinant trivializations, the signed B-field/twisted Chern character, and the period-index existence and K₀ realization input of LMS Lemma 3.4.3. In the K3 consumer, r=ℓ^n must equal the exact geometric Brauer order; rank divisibility then implies automatic stability for rank r. The fixed-determinant stack has μ_r inertia, whereas omitting the determinant isomorphism gives G_m inertia. Use the gerbe −[α_n] with LMS's exp(+α/r) vector convention and compare the untwisted B=0 case. Keep K3-specific nonemptiness, symplectic forms, dimensions, Fourier–Mukai equivalence and NS/cohomology isometries in K3SurfacesAndSymplecticBoundedness. Import intersection/Chern classes from SchemeAndStackFoundations SF.5, derived categories from the pinned category-theory library, and the exact Brauer/period-index supplier rather than assuming the desired rank-r sheaf. Read Langer, Lieblich and Yoshioka proof interiors before closing these nodes; currently only Charles and the full LMS manuscript have been read. Acceptance tests must distinguish stable from semistable, coarse from fine, arithmetic from geometric Brauer order, and μ_r from G_m scalar automorphisms.

#### OrthogonalIntegralModelsAndKugaSatake

The generic-fiber Shimura owner goes in this direction but stops before good-prime orthogonal integral models. PEL integral constructions explicitly have narrower scope, so neither a source route into V6 nor reuse of a PEL normalization would supply the needed theorem.

Start beyond Complex Shimura varieties and canonical models (ShimuraVarieties), importing its V0–V6 analytic arithmetic quotients, Baily–Borel/Borel maps and generic-fiber Hodge/abelian canonical models. Construct the full-Clifford Kuga–Satake realization of polarized weight-two Hodge structures with h²⁰=1, its spin-level orthogonal Shimura map to the polarized abelian moduli space, and the rational field-of-definition argument for the simultaneous h,l period subvariety. Import Hodge structures (tauceti:TauCetiRoadmap/HodgeStructures), Mathlib CliffordAlgebra, AbelianSchemesAndArithmeticModuli A4–A5, Siegel and PEL moduli problems (PELModuli M1–M3), and the common crystalline/étale comparison owners.

The final theorems are exactly the p≥5, prime-to-level, p-nondegenerate primitive-lattice setting of Charles equations (3.1)–(3.6) and Lemma 3.12: the family's KS map uniquely extends over W; the good-prime orthogonal model supports the finite unramified KS map needed in (3.5); the primitive twisted degree-two filtered F-crystal embeds primitively and strictly into the endomorphism crystal of H¹; and only finitely many such primitive sublattices occur over a fixed polarized level-n abelian special fiber and fixed primitive lattice. Prove independence of a characteristic-zero lift using the connection, and recover the integral image by saturation. Retain primitive and Tate-(1) labels in every fiber formula, despite their omission in printed (3.4). Use n≥3, p∤n; separate polarization parameter d₀ from degree d₀².

This is not supplied by PELModuli M4's normalizations or ShimuraCompactifications C5's good-prime PEL compactifications, whose documents explicitly reject a general integral canonical-model conclusion. Read Kisin 2010, Deligne 1972, André 1996, Rizov 2010 and the relevant Charles 2013 argument with its erratum before closing the proof. The erratum requires the degree-two/three p-torsion and even-form hypotheses in its source theorem; it is not an erratum to Charles 2016. Do not add arbitrary bad primes or all abelian-type models. The K3/IHS-specific admissibility, deformation and special-endomorphism-to-NS application belongs in the consuming K3 roadmap. Test fixed A₀ with distinct finite preimages, full versus even Clifford algebra, wrong full-H² domain, and a lattice degenerate modulo p.

#### GeometryOfNumbersAndQuadraticArithmetic

GN.2 owns new integral-lattice arithmetic/local classification and GN.3 reduction/finiteness. Supply Nikulin primitive-embedding arithmetic, the isotropic quotient determinant, unit norm representation, Frobenius-similitude lattice bounds and Cassels finiteness. Import the already implemented discriminant/index/gluing operations; do not re-plan the completed lattice roadmap. The continuation adds the exact Nikulin embedding-data/orbit boundary, genus specialization, primitive-input counterexample and explicit split positive plane; completed overlattice and discriminant-quotient constructions are imported.

#### AlgebraicModuliForArithmeticGeometry

R09.1 explicitly owns ampleness/Hilbert-polynomial boundedness, refined here by the K=0 Kollár–Matsusaka input and fiberwise-big uniformity; R09.3 owns the line-bundle descent distinction and receives the zero-cycle Brauer-obstruction lemma.

#### ShimuraVarieties

The complex boundedness proof is a concrete consumer/source of the already planned Baily–Borel and Borel algebraicity theorems. No second arithmetic quotient or algebraicity theorem belongs in the K3 route.

#### MotivesAndAlgebraicCycles

MC.7 owns exact Hodge/Tate statements and selected divisor cases. Register Lefschetz (1,1) as an early independent proof leaf and the two K3 Tate cases as late applications of the new geometry. Refine the stage before forming dependency edges: the K3 argument may consume the early leaf but cannot import its own later Tate theorem.

#### SchemeAndStackFoundations

Surface RR, adjunction, Hodge index and intersection products are expressly in SF.5. Specialize them to K3 surfaces in the consumer without constructing a second Chow or Chern-class theory.

#### AbelianSchemesAndArithmeticModuli

The complex abelian/integral-Hodge equivalence planned by A5 includes its Hom comparison. Lemma 3.15 uses this precise algebraicity of integral Hodge endomorphisms, not the general Hodge conjecture.

### Retained primitive-lattice argument

The continuation also read selected original [Nikulin publisher text](https://www.mathnet.ru/eng/im1677): §§1.1–1.6, the stability corollary and Theorem 1.14.2, and Proposition 1.15.1 with its proof and following orbit qualifications. The web PDF text was available, but local download returned HTTP 403 and page screenshots failed. Some formulas in the extraction are damaged. The result records these limits explicitly, with no invented PDF hash or claim of a full Nikulin read.

Nikulin 1.15.1 requires a complement and discriminant-form identification, then an isometry quotient of the data. It classifies embeddings up to ambient isometry; unmarked sublattices have an additional source-isometry quotient. The fixed target Λ₂n also requires the genus-uniqueness specialization for <2n>⊕U. The extraction separates these from the rank-one complement and from raw embedding data; item 37 is an existence criterion, not a raw-tuple bijection.

There is a more concrete problem in Charles Proposition 2.9: the proof needs an initial **primitive** embedding, but the printed hypothesis only says sublattice. The broader statement is false. In Λ₂=<2>⊕U, with basis h,e,f and e·f=1, the sublattice generated by 2h and 2(e+f) has Gram matrix diag(8,8). If it admitted any primitive embedding into Λ₂, reduction modulo 2 would give a two-dimensional subspace on which the half-norm

`Q(x,y,z)=x²+yz` over F₂

vanishes. Its nonzero singular vectors are exactly (0,0,1), (0,1,0) and (1,1,1). The sum of any two has Q=1, so such a plane does not exist. Taking m=1 meets every congruence and coprimality condition of the printed statement and disproves it. Saturating the initial sublattice does not preserve the primitivity conclusion for the original lattice. This is a derived audit counterexample, not an author-issued erratum.

The application in Theorem 2.10 can use an explicit primitive initial lattice. For d,k>0 in Λ₂d=<2d>⊕U, set

`v=e+f, w=kh+e, l=2w−v`.

Then the Gram matrix of v,w is `[[2,1],[1,2dk²]]`, with positive determinant `4dk²−1`. The integral map `(x,y,z)↦(z,y−z)` retracts the embedding `(a,b)↦av+bw`, proving that its image is primitive. Moreover,

`v²=2, v·w=1, l·v=0, l²=2(4dk²−1)>0`.

For the prime-to-n refinement, choose k to be a positive multiple of the odd integer |n|. Then l²≡−2 modulo n, so its norm is prime to n. This supplies the actual input needed by the corrected transport theorem and the Mukai coprimality argument. The orthogonal complement is explicitly generated by `(1,2dk,−2dk)` and has norm `−2d(4dk²−1)`.

Items 38–40 now make the transport conditions explicit. One can include `(2d)!` in N to ensure coprimality of m with the representative y₀∈[1,2d]. If u²≡−d and v²≡t modulo m, choose λ≡u(vy₀)⁻¹ modulo m and λ≡1 modulo 4dt. The two moduli are coprime, and the resulting unit rescales the quadratic generator as required. The primary genus/classification proofs remain separate dependencies.

The added library imports are the actual even-overlattice order equivalence, the canonical discriminant isometry `A_M≅H^⊥/H` with its representative formula, and the rank-one generator formulas. Their statements were read at Tau Ceti `f790474`. The half-norm Q/Z convention is retained throughout, with multiplication by two when passing to Nikulin's Q/2Z convention. These completed objects are not re-planned in GN.2/GN.3; only their embedding and arithmetic consumers are added there.

The earlier primitive-plane, finite-field obstruction, CRT and Mukai/index arithmetic checks were rerun unchanged. Their assertions are separate from the new arithmetic total.

### Remaining proof gates

- **G1 — Characteristic-two birational linear-series proof** (resolved): The source's 3r−4>r fails at r=2, and the final degree/h⁰ bounds for 4L are not the displayed r and 2r+1. Always doubling before the argument may repair the inequality, and then tracking powers gives uniform bounds, but the nonreduced-curve jet-separation-to-birationality step still needs a complete proof. Read Saint-Donat/Huybrechts and the Artin–Swinnerton-Dyer cited passage; certify a precise corrected bound. Items 51,124,125 depend on this gap. RESOLVED (cc-fb70e5, 22 September 2026): item 50 now carries a complete proof. It doubles to s=L₄²≥4, proves H⁰(C,−2L₄|_C+D(p)+D(q))=0 for non-reduced C=2C_red by the conormal filtration, lifts separation through H¹(X,2L₄)=0, and certifies N=128r+2 and d=256r. Item 50 is routed to K3SurfacesAndSymplecticBoundedness.
- **G2 — Valuation bounds do not provide rational square classes** (open): LMS Prop.2.1.2 gives ℓ-valuations of ℓ-adic discriminants, not a common rational square class supported on finitely many rational primes. Charles Lemma 4.5's rank-one deduction is therefore not justified by that citation alone. Either supply a compatible-system determinant theorem with its proof, or replace this literal claim by the split-prime/quadratic-extension LMS lemma, item 114. This continuation replaces the needed p≥5 prime selection by simultaneous-k3-norm with full finite-extension and compositum data. The literal original-field assertion113 is still unproved; no compatible rational determinant for its arithmetic invariant lattice has been inferred from valuations.
- **G3 — Complete the simultaneous split-prime replacement** (partially_resolved): The complete p≥5 prime-choice composition is now simultaneous-k3-norm: finite base extension, quadratic Frobenius, one common Galois compositum, identity Chebotarev Layer10, canonical Q_l embeddings, unit representation, prime-power residue lifting and rational Tate descent. Item119 is assigned to the exact existing upstream layer. Remaining for the all-characteristic consumer: audit the original geometric semisimplicity, pairing-compatible comparison and Brauer/cohomology inputs in p=2,3. A source scope restriction is not silently removed.
- **G4 — Final partner polarization and nonsuperspecial hypotheses** (open): Construct the simultaneous deformation of the gerbe, v_n, projective twisted moduli space and H_n with generic Picard rank one. Item 128 spells out why a verified projective rank-one family proves special ampleness; mere generic ampleness would not. Separately verify that the X_n to which Proposition 3.17 is applied are nonsuperspecial, or establish an allowed reduction covering exceptions. Do not assume Tate to prove that hypothesis.
- **G5 — Primitive embedding interfaces resolved; deeper source proof leaves remain** (open): Primary Nikulin text1.4–1.6,1.13.4,1.14.2 and1.15.1–5 was read through the publisher web PDF. Item37 now separates genus existence from marked embedding/sublattice orbit classification. Item38 now requires an initial primitive embedding; nonprimitive-obstruction proves the printed broader statement false. Item41 now has an explicit primitive construction with all prime-to-n properties. Full local PDF acquisition/image checks and deeper local genus/strong-approximation proofs remain open; the text extraction contains some OCR-damaged formulas. No full Nikulin-paper read is claimed.
- **G6 — Original prerequisite proofs and remaining declaration-sized decomposition** (open): The main published paper and full LMS arXiv manuscript were read; the other prerequisite interiors listed in prerequisites were not. In particular verify Fontaine–Messing small-degree range, integral θ construction, twisted period-index/nonemptiness, Yoshioka's integral quotient, IHS Torelli and special-endomorphism lifting with the 2013 erratum. Their source-extracted endpoints are not a closure certificate. Expand each quoted proof into all intermediate declarations at blueprint time or in a resumed extraction. Fresh Huybrechts pp16–18 identify the full geometric K3 determinant input. Its pairing-compatible smooth-proper/Betti comparison is an explicit MC.2 request; WC.4 dimension comparison alone does not supply it.

The G1 resolution and item 50 proof are inherited from cc-fb70e5 unchanged. Historical continuation counts in the JSON are labeled as historical; the current counts are at the start of this report. Most inherited source endpoints still need declaration-sized proof decomposition. The recorded dependency graph is not a proof-closure certificate.

### Source findings

#### PAPER-CHARLES-16/E1: error

**Locator:** Corollary 2.8 and its proof, pp.499–500, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** λ need not be an integer. With I = [N(X) : Zv ⊕ (v^⊥ ∩ N(X))], one has |disc NS(X)| = p^t (v²/I²) |disc NS(M_H(v))| with t ≥ 0. So λ = v²/I² is a positive rational number with λ ≤ v², and I divides v² because v is primitive. For p ∤ v², for example v² = 2 and p ≥ 3 as in the applications, λ is still a p-adic unit, which is what the later arguments use.

**Reason:** Take v = (1, 0, −1), the Mukai vector of ideal sheaves of length-two subschemes, so M_H(v) = X^[2]. It satisfies condition (C): it is primitive, of rank 1, v² = 2, and gcd(1, 0, −1) = 1. Then v^⊥ ∩ N(X) = NS(X) ⊕ Z(1, 0, 1) with (1, 0, 1)² = −2, so |disc(v^⊥ ∩ N(X))| = 2|disc NS(X)|. The proof's first step gives |disc(v^⊥ ∩ N(X))| = p^r |disc NS(M_H(v))|. Hence |disc NS(X)| = ½ p^r |disc NS(M_H(v))|, which is not of the form p^t λ with λ a positive integer when p is odd. The proof passes from the equality disc(Zv ⊕ K) = I² disc N(X) to an integer multiplier without controlling I, here I = 2. The inequality stated for p = 0 is correct. Checked on the page image. Noted by the extraction (items 34–35).

**Affects:** a stated result. **Known:** new.
#### PAPER-CHARLES-16/E2: error

**Locator:** Proposition 2.9, p.500, as used in the proof of Theorem 2.10, p.503, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** Assume Λ is a primitive sublattice of Λ_2d. In the proof of Theorem 2.10, choose the lattice Λ containing v, w with v² = 2, v·w = 1 to be primitive. For example, in Λ_2d = ⟨2d⟩ ⊕ U with basis h, e, f, take the span of v = e + f and w = kh + e. It is primitive, since (x, y, z) ↦ (z, y − z) retracts it, and its Gram matrix [[2, 1], [1, 2dk²]] is positive definite.

**Reason:** The proof starts from a primitive embedding Λ ⊂ Λ_2d, which the statement does not provide, and the statement fails for non-primitive Λ. In Λ_2 = ⟨2⟩ ⊕ U, the sublattice Λ generated by 2h and 2(e + f) has Gram matrix diag(8, 8). Take m = 1, which satisfies (i) and (ii) for every N, a, b. A primitive embedding of Λ into Λ_2 would give a 2-dimensional subspace of Λ_2/2Λ_2 = F_2³ on which the half-norm Q(x, y, z) = x² + yz vanishes, since Λ has all half-norms even. The nonzero zeros of Q are (0,0,1), (0,1,0) and (1,1,1), and each pairwise sum has Q = 1, so no such plane exists. Noted by the extraction (items 38–41), which also gave the primitive choice above.

**Affects:** a stated result. **Known:** new.
#### PAPER-CHARLES-16/E3: gap

**Locator:** Proof of Proposition 3.1, p.506, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** Pass to 2L before this step, as the proof already allows ("up to replacing L by 2L"), so that r = L² ≥ 4 and 3r − 4 > r holds.

**Reason:** 3r − 4 > r holds only for r > 2. "r is even, so that r > 1" leaves r = 2, the double-plane case, where 3r − 4 = r and the surjectivity argument as written does not apply. The proposition only claims the existence of some L′ with bounded invariants, so doubling L is allowed. Noted by the extraction (item 50), which also leaves the characteristic-two nonreduced-curve argument as an open check.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E4: misprint

**Locator:** Proof of Proposition 3.16, p.516, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** "Fix some integer n ≥ 3", prime to p, as in the Kuga–Satake setup on p.513 ("Let n ≥ 3 be an integer prime to p").

**Reason:** The level-n structure is used to make the Kuga–Satake abelian varieties rigid and finite in number over the finite field, which needs level at least 3. The earlier setup on p.513 has n ≥ 3. Noted by the extraction (item 78).

**Affects:** nothing. **Known:** new.
#### PAPER-CHARLES-16/E5: error

**Locator:** Proposition 3.17, p.517, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** There are only finitely many k-isomorphism classes of nonsuperspecial K3 surfaces X over k admitting a polarization H of such a degree 2md with (i)–(iii). The polarized pairs themselves need not be finite in number.

**Reason:** On a fixed eligible (X, H) of degree 2m_0 d, the line bundles H^{⊗ℓ^j} have degree 2(ℓ^{2j} m_0)d. Choose a prime ℓ with a and b quadratic residues modulo ℓ and prime to N, a and b, and let j run through multiples of the order of ℓ² modulo N. Then m = ℓ^{2j} m_0 satisfies (i) and (ii), and (iii) is unchanged. This gives infinitely many pairwise non-isomorphic polarized pairs on one surface; the paper does not require polarizations to be primitive. The proof bounds NS(X_k̄) and then the surfaces. The only use, the proof of Theorem 1.3 on p.523, reads "there exist only finitely many K3 surfaces over k", so the corrected statement is what is used. Noted by the extraction (items 88–89).

**Affects:** a stated result. **Known:** new.
#### PAPER-CHARLES-16/E6: error

**Locator:** §4.1, the definition of N_{α/r}(X) and (4.1), pp.518–519, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** Define N_{α/r}(X) directly as the lattice (4.1), the twisted Mukai lattice CH_{α/r}(X, Z) of [LMS14], and drop "the preimage of N(X) by T_{−α/r}".

**Reason:** With T_{−α/r}(x) = x ∪ e^{−α/r} and e^{−α/r} = (1, −α/r, α²/(2r²)), one computes T_{−α/r}(ar, D + aα, cω) = (ar, D, (c − (α·D)/r − aα²/(2r))ω). Its last coordinate is not an integer in general, for α ∈ H²(X, Z_ℓ(1)) primitive and r = ℓ^n. So the lattice (4.1) is not the preimage of N(X). Lemma 4.2, Proposition 4.3 and §4.2 compute with the explicit lattice (4.1), so the results are unaffected. Noted by the extraction (§4.1 conventions, items 93–106).

**Affects:** nothing. **Known:** new.
#### PAPER-CHARLES-16/E7: misprint

**Locator:** Proof of Theorem 1.3, p.522, in the published version, Annals of Mathematics 184 (2016), 487–526 (publisher PDF, SHA-256 3425f269…40e2)

**Correction:** c_1(H_n)² = 2dℓ^{2n}.

**Reason:** B is the divisor from the proof of Theorem 1.4 and plays no role here; the class computed is h_n, giving H_n.

**Affects:** nothing. **Known:** new.
#### PAPER-CHARLES-16/E8: gap

**Locator:** Charles Lemma4.5, p521

**Correction:** The valuation estimate alone does not give a common finitely supported rational discriminant square class. Use the explicit p≥5 quadratic-extension splitting substitute for the present consumer; retain the literal claim as open.

**Reason:** Each l-adic discriminant is defined modulo l-adic unit squares. A uniform bound on its l-valuation does not compare square classes at distinct primes. A valuation-zero rank-one form can have nonsquare unit coefficient.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E9: misprint

**Locator:** Charles Proposition3.1 proof, final display p506

**Correction:** If the final line bundle is4L with L²=r, its square is16r and h⁰(4L)=8r+2 under the stated vanishing; incorporate preceding replacements as well. Item50 retains the inherited repaired existential bounds.

**Reason:** The printed degree and projective dimension use the original L although the map uses4L. This is distinct from E3’s r=2 inequality.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E10: misprint

**Locator:** LMS Lemma3.5.1 proof, published p302 and arXiv v5 p15

**Correction:** With d=dim(V_λ), replace the block discriminant by(−1)^d. The theorem’s total exponent n/2 is correct.

**Reason:** The paired block has dimension2d and Gram matrix[[0,I_d],[I_d,0]], determinant(−1)^d. For d=1 the printed exponent is not an integer.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E11: error

**Locator:** LMS Lemma3.5.2 proof, published p302 and arXiv v5 p16

**Correction:** For the rank≥2 unimodular lattice argument assert representation of every unit. For the fixed nonzero rational target d discard its numerator and denominator primes first; d=0 is immediate.

**Reason:** The unimodular form x²+y² over Z_3 does not represent3: modulo3 forces x,y divisible by3, and then9 divides its norm. The corrected unit assertion suffices for the actual lemma.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E12: error

**Locator:** LMS Proposition2.1.2, published pp287–288 and arXiv v5 p3

**Correction:** Add the pairing compatibility B(φx,φy)=q^w B(x,y) used in the orthogonality step. The K3 Frobenius application has precisely that compatibility.

**Reason:** Without it, take weight0, rank2, φ=diag(1,−1), and Gram[[l^m,1],[1,0]] on Z_l². The lattice is unimodular and φ semisimple with Weil weight-zero eigenvalues, but its1-eigenlattice has discriminant l^m for arbitrary m, contradicting the uniform bound.

**Affects:** a stated result. **Known:** new.
#### PAPER-CHARLES-16/E13: misprint

**Locator:** Charles (3.4) and Lemma3.12, p514

**Correction:** Carry the Tate twist(1) and the primitive part orthogonal to L from(3.3) into the displayed crystalline embedding and its use in Lemma3.12.

**Reason:** Equation(3.3) has weight-zero primitive domain. Removing the twist changes Frobenius weights; adjoining the polarization direction is not supplied by that embedding.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E14: misprint

**Locator:** Charles §4.1 p519, gerbe convention; compare LMS §3.3 arXiv v5 p11

**Correction:** With the exp(+α/r) twisted Mukai convention imported from LMS, use the gerbe class −[α_n], or reverse the B-field convention consistently throughout.

**Reason:** LMS explicitly chooses the negative class before defining its positive exponential Mukai vector. The Charles shorthand mixes these two signs.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E15: gap

**Locator:** Charles §4.1 p519, simple-sheaf moduli paragraph; LMS Definition3.4.1 arXiv v5 p13

**Correction:** Include a chosen determinant isomorphism in each moduli object, as in the cited LMS definition.

**Reason:** Without the determinant isomorphism a simple sheaf has scalar inertia G_m. Preserving that isomorphism imposes λ^r=1 and gives µ_r.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E16: gap

**Locator:** Charles §4.1 p519, isotropic moduli assertion; LMS Proposition3.4.2 proof arXiv v5 p13

**Correction:** For the imported automatic-stability proof require r to be the order of the geometric Brauer class after algebraic closure. Primitive B-field numerator alone and arithmetic order alone do not establish this.

**Reason:** The LMS proof excludes intermediate-rank subsheaves by the geometric Brauer order. A primitive algebraic divisor B-field may have zero Brauer class; its primitivity does not prove the order condition. Retain the separate exact-order and moduli proof gates.

**Affects:** the proof. **Known:** new.
#### PAPER-CHARLES-16/E17: misprint

**Locator:** Charles p522, partner-pairing and Theorem1.4 proof

**Correction:** The selected Mukai convention gives v_n·(0,D,0)=+2d. The positive-square divisor B_n obtained via(4.2) lies on X_n.

**Reason:** The pairing is (γ+D)·D=2d because γ is orthogonal to NS. The codomain of(4.2) is NS(M(v_n))=NS(X_n). The divisibility estimate is unchanged.

**Affects:** nothing. **Known:** new.

### New interfaces and proof outlines

#### PAPER-CHARLES-16/finite-quadratic-sums — Two quadratic polynomials over a finite odd field

**library**. For a finite integral domain F of odd cardinality and polynomials f,g∈F[T] of degree exactly two, there exist x,y with f(x)+g(y)=0. In particular a*x²+b*y²=t has a solution for all nonzero a,b and all t∈F.

Source: Mathlib/FieldTheory/Finite/Basic.lean81–102
#### PAPER-CHARLES-16/diagonalization — Nondegenerate quadratic forms diagonalize with unit weights

**library**. For a finite-dimensional vector space over a field of characteristic different from two, a quadratic form with separating associated bilinear form is equivalent to a weighted sum of squares whose weights are units.

Source: Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean177–185
#### PAPER-CHARLES-16/discriminant-sum — Existing plain discriminant and its orthogonal-sum law

**library**. TauCeti.RegularFormClass.discr is the plain Gram-determinant square class. The discriminant of an orthogonal sum is the product of its two discriminants, written as addition in the library’s additive SquareClassGroup. This is not the signed discriminant.

Source: TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean95–119
#### PAPER-CHARLES-16/split-criterion — Identity Artin class and complete splitting

**library**. For a prime of a number field unramified in a finite Galois extension, its Artin class is the identity exactly when the number of primes above it equals the extension degree. Over Q this means e=f=1 at every prime above the rational prime; the residue-field map from F_l is bijective.

Source: TauCeti/NumberTheory/NumberField/ArtinSymbol.lean223–233; SplitsCompletely.lean82–141
#### PAPER-CHARLES-16/cyclotomic-frobenius — Arithmetic Frobenius on roots of unity

**library**. For a number field K, extension field F, an m-th root of unity ζ∈F, a height-one prime q of the integers of K avoiding m, an ideal Q above q and an arithmetic Frobenius σ at Q, σ(ζ)=ζ^(Norm q). For primitive ζ, the cyclotomic character of σ is Norm q modulo m. In particular an identity Frobenius over Q forces l≡1 mod m.

Source: TauCeti/NumberTheory/NumberField/Cyclotomic/Frobenius.lean96–143; accepted Chebotarev Layer4 audit
#### PAPER-CHARLES-16/split-local-embedding — A completely split prime gives a Q_l embedding

**planned**. Let E/Q be a finite Galois number field and l a rational prime splitting completely in E. For each place w above l, the canonical completion E_w is Q_l as a Q_l-algebra. Composition with E→E_w gives a Q-embedding E→Q_l. Consequently a polynomial splitting in E splits in Q_l, and every rational radicand whose square root belongs to E is a square in Q_l.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/split-criterion, tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places.

1. Use the existing splitting criterion to obtain e(w/l)=f(w/l)=1. Consume the canonical completion map and degree formula of NumberFieldArithmetic Layer5.2/5.5, so [E_w:Q_l]=1.

2. A one-dimensional unital extension of Q_l is Q_l through its structure map. Its inverse, composed with E→E_w, is the desired field embedding. This uses the canonical compatible completion algebra, not an arbitrary Algebra instance.

3. Apply the embedding to every linear factor or square-root identity. If d∈Q× has l-adic valuation zero, a square root in Q_l has valuation zero too, and therefore lies in Z_l×.
#### PAPER-CHARLES-16/reciprocal-pair — Reciprocal eigenspaces form a hyperbolic block

**missing**. Let V carry a nondegenerate symmetric bilinear form over a field F of characteristic different from two, and let φ be a diagonalizable isometry with all eigenvalues in F. If λ≠±1, then V_λ and V_(λ⁻¹) are totally isotropic, pair perfectly with one another, and have equal dimension r. Their sum has Gram matrix [[0,I_r],[I_r,0]] in dual bases and plain discriminant (−1)^r modulo squares.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/discriminant-sum.

1. For x∈V_λ and y∈V_μ, invariance gives (λμ−1)B(x,y)=0. Thus V_λ is orthogonal to all eigenspaces except V_(λ⁻¹), and to itself when λ²≠1.

2. The eigenspaces span V. Any vector annihilating its reciprocal eigenspace therefore annihilates V and is zero. The two pairing maps are injective into one another’s duals, so dimensions agree and the pairing is perfect.

3. Choose a basis on V_λ and its dual on V_(λ⁻¹). The block matrix exchanges two blocks of size r and has determinant (−1)^r. The exponent is r, not r/2.
#### PAPER-CHARLES-16/reciprocal-discriminant — Discriminant of the squared-isometry fixed space

**missing**. Under the preceding hypotheses, W=ker(φ²−1)=V_1⊕V_(−1) is nondegenerate. If n=dim V−dim W, then n is even and disc(W)=(−1)^(n/2)disc(V) in F×/(F×)². In particular W has square discriminant if both −1 and disc(V) are squares in F.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/reciprocal-pair, PAPER-CHARLES-16/discriminant-sum.

1. The polynomial T²−1 has distinct roots in F, and diagonalization identifies its kernel with the two indicated eigenspaces.

2. Partition all other eigenvalues into distinct unordered reciprocal pairs. The reciprocal-pair lemma makes each block nondegenerate, orthogonal to W and all other blocks; hence W is nondegenerate too.

3. Each block contributes even dimension 2r and discriminant (−1)^r. Multiply the discriminants using the built plain orthogonal-sum law. Rearranging gives the stated sign because that sign is its own inverse.
#### PAPER-CHARLES-16/integral-orthogonal-split — Unimodular sublattices split integrally

**missing**. Let M be a finite free Z_l-module with an integral symmetric pairing, and P⊂M a finite free submodule whose restricted Gram determinant is a unit. Then M=P⊕P⊥ integrally. If M is unimodular, so is P⊥; its determinant is disc(M)/disc(P) modulo unit squares.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/discriminant-sum.

1. Choose a basis p_i of P with invertible Gram matrix A over Z_l. For m∈M, the column of pairings B(m,p_i) is integral, so A⁻¹ times that column gives an element p∈P with m−p orthogonal to P.

2. The restriction to P is nondegenerate, so P∩P⊥=0. This yields a direct-sum decomposition and also proves P is saturated.

3. A direct summand of the finite free module over Z_l is finite free. In the combined bases the Gram matrix is block diagonal. Its determinant is the product; if the total and first block are units then so is the second.
#### PAPER-CHARLES-16/unit-representation-lift — Unimodular odd-adic lattices represent units in rank at least two

**missing**. Let l be odd and let M be a finite free Z_l-module of rank at least two with a unimodular symmetric pairing B. For every t∈Z_l× there exists a primitive v∈M with B(v,v)=t. No representation claim for every nonunit t is made.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/115, PAPER-CHARLES-16/116.

1. Reduction of B modulo l is nondegenerate. Item115 supplies a vector vbar of norm tbar. Since tbar≠0, vbar≠0.

2. Choose a lift v and a coordinate vector e for which 2B(v,e) is a unit: invertibility of the Gram matrix and vbar≠0 guarantee such a coordinate.

3. The polynomial F(z)=B(v+ze,v+ze)−t has F(0)∈lZ_l and unit derivative F′(0)=2B(v,e). Apply the pinned Hensel theorem to get z∈lZ_l with F(z)=0.

4. The new vector reduces to vbar and is primitive. For comparison, x²+y² over Z_3 is unimodular but cannot represent 3: reduction modulo3 forces both coordinates divisible by3, making the norm divisible by9.
#### PAPER-CHARLES-16/rank-one-norm — A square discriminant solves the rank-one norm equation

**missing**. For a rank-one unimodular Z_l-lattice with generator e of norm u∈Z_l×, if u and the target t∈Z_l× are squares in Q_l, then the lattice has a primitive vector of norm t. For l odd, being a square in Q_l is equivalent to the unit’s reduction being a square in F_l.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/116.

1. Write u=a² and t=b² in Q_l. The valuations of a and b are zero, so both are units of Z_l. Then v=(b/a)e has norm t and is primitive.

2. Reduction gives one implication of the final equivalence. Conversely lift a nonzero residue square root using F(X)=X²−u with unit derivative; the pinned Hensel theorem gives a unit square root.
#### PAPER-CHARLES-16/k3-determinant — The geometric K3 pairing has determinant square class minus one

**missing**. For a K3 surface X over an algebraically closed field and l different from its characteristic, H²_et(X,Z_l(1)) is free of rank22 with a perfect cup-product pairing; its plain determinant has square class −1 in Q_l×/(Q_l×)². This is a statement about the full geometric pairing, not its Frobenius invariants.

Source: Huybrechts author draft, Chapter1 §3, pp16–18, Proposition3.5 and Remark3.7; LMS Lemma3.5.2 p302

Prerequisites: PAPER-CHARLES-16/3, PAPER-CHARLES-16/12, MotivesAndAlgebraicCycles:MC.2.

1. For a complex K3 surface, the freshly read proof gives rank22 and a unimodular intersection pairing of signature(3,19). Its determinant is a unit in Z and has negative sign, hence equals −1. This numerical conclusion does not need the full classification of even unimodular lattices.

2. In positive characteristic, use item12 with one ample line bundle to obtain a projective characteristic-zero lift. Descend this finite-presentation data to a suitable finitely generated base and choose the comparison fibers.

3. Transport the cup product and degree trace through smooth proper base change and étale–Betti comparison. The precise pairing-compatible comparison is an MC.2 supplier request below. WC.4 supplies dimensions only and is not credited as the required isometry.

4. The source proof of the geometric comparison and the original lifting inputs remain in G6. This records the exact arithmetic determinant input used by LMS rather than inferring a square class from an l-adic valuation bound.
#### PAPER-CHARLES-16/compatible-system-norm — Norm selection from split orthogonal compatible systems

**missing**. For each sufficiently large odd prime l let M_l be a unimodular Z_l-lattice with semisimple isometry φ_l whose characteristic polynomial is one fixed P∈Q[T], and suppose disc(M_l⊗Q_l) is one fixed rational square class δ. Put N_l=M_l∩ker(φ_l²−1), assume N_l unimodular, and let A_l⊂N_l be isometric to A⊗Z_l for a fixed nondegenerate integral lattice A. Suppose T_l=A_l⊥∩N_l has positive rank. Fix t∈Q×. If l avoids the numerators/denominators of t,δ and disc A and the splitting field E of P together with √−1,√δ,√(disc A),√t embeds into Q_l, then T_l contains a primitive vector of norm t.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/reciprocal-discriminant, PAPER-CHARLES-16/integral-orthogonal-split, PAPER-CHARLES-16/unit-representation-lift, PAPER-CHARLES-16/rank-one-norm.

1. The E-embedding splits the characteristic polynomial, so semisimplicity makes φ_l diagonalizable over Q_l. It also makes −1,δ,disc A and t squares in Q_l.

2. The reciprocal-discriminant formula makes the fixed rational space N_l⊗Q_l have square discriminant. The integral orthogonal-splitting lemma gives N_l=A_l⊕T_l and makes T_l unimodular.

3. If rank T_l≥2 use the unit-representation lift, noting t∈Z_l× after the finite exclusions. In rank1 use the determinant quotient to see the generator norm is a square, then apply rank-one-norm.

4. The claim holds for every prime satisfying these conditions, not merely for an unspecified infinite subset. Therefore extra splitting conditions can be imposed on the same primes without intersecting unrelated infinite sets.
#### PAPER-CHARLES-16/prime-power-residues — Residue squares lift to every prime power

**missing**. Let l be odd, a∈Z prime to l, and a a nonzero square modulo l. Then a is a square modulo l^m for every m≥1. If also l≡1 mod N with N≥1, then l^(2n)≡1 mod N for every n≥1.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/116.

1. Lift a nonzero root of X²−a modulo l by Hensel; its derivative is a unit. Reducing the resulting root in Z_l modulo l^m supplies a root at every level.

2. Alternatively, if b²−a is divisible by l^j, choose c modulo l with (b²−a)/l^j+2bc≡0 mod l. Then b+c*l^j is a root modulo l^(j+1).

3. The congruence on l is preserved under all powers. Both facts apply simultaneously to the finitely many fixed integers used by Proposition3.17.
#### PAPER-CHARLES-16/prime-choice-data — The common splitting field for the K3 prime choice

**missing**. After first choosing k0/k with geometric NS defined over k0, let k1/k0 be quadratic. Fix D∈NS(X_k1) with D²≠0 and, when using Proposition3.17, choose its constants N≥1,a,b∈the nonzero integers over k1. Put t=−D², s=disc NS(X_k1), and let E/Q be the finite Galois compositum of the splitting field of the Frobenius polynomial over k0, Q(i), Q(√t), Q(√s), Q(√2), Q(√a), Q(√b), and Q(ζ_N). Choose one finite exceptional set containing2,p, the prime divisors of N,t,s,a,b and the invariant-pairing exceptions for k1. Every sufficiently large prime splitting E satisfies all required rational square and congruence conditions simultaneously.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/119, PAPER-CHARLES-16/split-local-embedding, PAPER-CHARLES-16/cyclotomic-frobenius.

1. Every listed extension is finite and Galois, so their compositum is finite and Galois. No linear-disjointness hypothesis is required. The identity conjugacy class restricts to the identity in every factor.

2. Item119 supplies infinitely many completely split primes outside the exceptional set. Split-local-embedding places all Frobenius roots and chosen square roots in Q_l.

3. Splitting in Q(ζ_N), with l∤N, gives l≡1 mod N by the cyclotomic Frobenius formula. The radicands are l-adic units, so their square roots reduce to nonzero squares modulo l.

4. The constants belong to the surface over the new finite field. Choose them after changing the base field and before choosing l; constants from the original field are not reused without a proof.

API contracts:

- `Charles16.primeChoiceData.compositum` (constructor): Construct the finite Galois compositum inside a fixed algebraic closure of Q from the Frobenius polynomial and the listed rational radicands and cyclotomic field.
- `Charles16.primeChoiceData.goodPrimes` (characterisation): A completely split prime outside the explicit finite set supplies a Q_l embedding, every listed unit square root and l≡1 mod N.
- `Charles16.primeChoiceData.enlarge` (functoriality): Adjoining finitely many additional radicands or replacing N by a multiple produces a stronger prime condition with infinitely many solutions by the same identity-class supplier.

Proposed tests:

- `Charles16.primeChoiceData.test1`: For E=Q(i,√2,ζ3), l=73 splits, is1mod24, and −1,2,3 are squares modulo73.
- `Charles16.primeChoiceData.test2`: N=1 contributes the trivial cyclotomic field; repeated or square radicands do not impose new conditions.
- `Charles16.primeChoiceData.test3`: An arbitrary nonidentity residue class cannot be combined with splitting: E=Q(i) and l≡3mod4 are incompatible. Identity-class congruences avoid this obstruction.
#### PAPER-CHARLES-16/finite-extension-tate-descent — Rational divisor Tate descends along a finite extension

**planned**. Let X be smooth projective over a finite field k, k1/k finite of degree e, and l≠char k. If the rational divisor cycle map is surjective onto the Frobenius invariants over k1, then it is surjective over k. This implication concerns Q_l coefficients; it does not assert integral surjectivity. Consequently failure of rational Tate persists after any finite field extension.

Source: Charles Theorems1.3–1.4 finite-extension reductions; direct trace argument with cycle-class suppliers

Prerequisites: MotivesAndAlgebraicCycles:MC.0, MotivesAndAlgebraicCycles:MC.2.

1. A k-invariant class v is also k1-invariant, so choose a Q_l-linear combination of divisors over k1 with class v.

2. Push those divisors forward along X_k1→X. After geometric pullback their cycle class is the sum of the e Galois conjugate classes, hence e*v. Divide the coefficients by e in Q_l.

3. This proves descent and its contrapositive. Even when l divides e, e remains invertible in Q_l; that observation does not give an integral Z_l statement. For K3s, the separate saturation statement in item90 and Brauer criterion91 may be applied only with their own hypotheses.

4. The MC.7 dependency is an early implication lemma between Tate statements, not a proof of the final K3 Tate theorem. The proof uses only MC.0 pushforward and MC.2 trace compatibility, so no cycle through the K3 application is introduced.
#### PAPER-CHARLES-16/simultaneous-k3-norm — The composed K3 prime choice in characteristic at least five

**missing**. Let X/k be K3 over a finite field of characteristic p≥5 and suppose its rational divisor Tate conjecture fails. After a finite extension k0/k defining geometric NS and the quadratic extension k1/k0, fix D∈NS(X_k1) with D²≠0 and constants N≥1,a,b∈the nonzero integers. There are infinitely many odd l, outside any further finite set, with l≠p, l∤N*a*b*D²*disc NS, l≡1modN, 2,a,b squares modulo every l^m, and a primitive γ∈T(X_k1,Z_l) satisfying γ²=−D². Thus for every n≥1 the same l makes m=l^(2n) satisfy Proposition3.17’s congruence and square conditions. The other moduli/polarization hypotheses of that proposition are separate.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/finite-extension-tate-descent, PAPER-CHARLES-16/91, PAPER-CHARLES-16/110, PAPER-CHARLES-16/111, PAPER-CHARLES-16/112, PAPER-CHARLES-16/k3-determinant, PAPER-CHARLES-16/compatible-system-norm, PAPER-CHARLES-16/prime-choice-data, PAPER-CHARLES-16/prime-power-residues.

1. Tate failure survives the two finite extensions by rational descent. Apply item91 over k1 to obtain infinite arithmetic Brauer group, and item112 to obtain positive rank of T_l. Geometric NS is already fixed over k0 and remains fixed over k1.

2. For the full geometric Tate-twisted pairing, Frobenius φ over k0 is an isometry. Its square is Frobenius over k1. Item111 supplies semisimplicity and the common rational polynomial; k3-determinant supplies the total square class −1.

3. Item110, with its required similitude condition and with k1 as base, gives unimodularity of the invariant lattice for all sufficiently large l. Remove the finitely many NS-discriminant primes and use integral-orthogonal-split.

4. Use prime-choice-data to select the same split primes with every added condition. Apply compatible-system-norm at each such prime with δ=−1 and t=−D². The output vector is primitive because its norm is a unit.

5. Apply prime-power-residues to a,b and2; raising l to2n preserves the congruence. This closes the prime-choice composition in the source’s p≥5 scope. It does not prove the original-field norm-one assertion113 or the remaining all-characteristic input audit, nor the projective deformation and nonsuperspecial gates.
#### PAPER-CHARLES-16/unit-norm-primitive — Unit norm detects primitive classes and exact quotient order

**missing**. Let M be finite free over Z_l with integral symmetric pairing, P⊂M a unimodular sublattice, and γ∈P⊥ with unit norm. Then γ is primitive in P⊥ and its image in M/P is not divisible by l. The image of γ/l^n in (M/P)⊗_(Z_l)(Q_l/Z_l) has exact order l^n. Identifying this quotient with a Brauer subgroup requires the separate Kummer comparison.

Source: LMS §3.5, published p302; Charles §4.2 pp520–522; proof supplied in this continuation

Prerequisites: PAPER-CHARLES-16/integral-orthogonal-split.

1. If γ=lη in the orthogonal complement then γ²=l²η² cannot be a unit. The direct-sum decomposition identifies M/P with P⊥, so its image is not divisible by l either.

2. In a basis of P⊥ at least one coordinate of γ is a unit. Dividing this coordinate by l^n gives exact order l^n modulo Z_l; all coordinates are killed by l^n. No arithmetic Brauer order is substituted for the geometric quotient order.

### Verification

The paper checker and three-file intake check passed. Structural verification retained all 153 previous IDs, all 132 previous API and test names, all nine routes, and the inherited item 50 proof. It checked 73 recorded internal and 5 external stage edges, acyclicity, stage references, route uniqueness outside the two explicit gaps, 524 input hashes and nine fresh declaration hashes.

The exact arithmetic certificate passed 154,556 assertions across finite-field unit representation, derivative witnesses, coordinate Hensel lifts, reciprocal determinants, orthogonal projections, source counterexamples, congruences, quotient orders and rational trace division. It also reruns the previous arithmetic regressions. The JSON contains a self-contained executable certificate. These finite checks do not certify Chebotarev, geometric comparison, Tate or Lean elaboration.

### Item register

Every definition/construction has three structured API contracts, consumer references and three proposed tests in the JSON. Exact proof outlines, library declarations and external requests are retained there. The table gives the complete current item register.

| Item | Name | Status |
| --- | --- | --- |
| PAPER-CHARLES-16/1 | K3 surfaces | missing |
| PAPER-CHARLES-16/2 | Numerical Néron–Severi lattice | missing |
| PAPER-CHARLES-16/3 | K3 cycle-class injection and torsion freeness | missing |
| PAPER-CHARLES-16/4 | ℓ-adic Mukai lattice | missing |
| PAPER-CHARLES-16/5 | Algebraic Mukai lattice | missing |
| PAPER-CHARLES-16/6 | Sheaf Mukai vector | missing |
| PAPER-CHARLES-16/7 | Mukai Riemann–Roch pairing | missing |
| PAPER-CHARLES-16/8 | Gieseker stability | missing |
| PAPER-CHARLES-16/9 | Stable-sheaf moduli space | missing |
| PAPER-CHARLES-16/10 | Condition (C) | missing |
| PAPER-CHARLES-16/11 | Coprimality excludes strictly semistable sheaves | missing |
| PAPER-CHARLES-16/12 | Lifting up to ten divisor classes | missing |
| PAPER-CHARLES-16/13 | Finite-height K3 lifting with Picard data | missing |
| PAPER-CHARLES-16/14 | Dimension argument for simultaneous lifting | missing |
| PAPER-CHARLES-16/15 | Smooth symplectic stable-sheaf moduli | missing |
| PAPER-CHARLES-16/16 | Hilbert-scheme deformation type | missing |
| PAPER-CHARLES-16/17 | Irreducible holomorphic symplectic variety | missing |
| PAPER-CHARLES-16/18 | Hilbert scheme of points on a K3 surface | missing |
| PAPER-CHARLES-16/19 | Prime-to-characteristic Beauville–Bogomolov form | missing |
| PAPER-CHARLES-16/20 | Beauville–Bogomolov form on NS | missing |
| PAPER-CHARLES-16/21 | Mukai cohomological isometry | missing |
| PAPER-CHARLES-16/22 | Integral algebraic Mukai map | missing |
| PAPER-CHARLES-16/23 | Prime-primary cokernel of the algebraic Mukai map | missing |
| PAPER-CHARLES-16/24 | Quasi-universal sheaf correspondence and descent | missing |
| PAPER-CHARLES-16/25 | Degeneration for a Witt-lifted sheaf moduli space | missing |
| PAPER-CHARLES-16/26 | Degree-one Hodge numbers of Witt-lifted moduli | missing |
| PAPER-CHARLES-16/27 | Integral low-degree cohomology of K3 Hilbert schemes | missing |
| PAPER-CHARLES-16/28 | Crystalline torsion-freeness in the small-degree lifting regime | missing |
| PAPER-CHARLES-16/29 | Saturated NS specialization and integral generic Mukai map | missing |
| PAPER-CHARLES-16/30 | Integral symmetric lattice carrier | library |
| PAPER-CHARLES-16/31 | Half-norm discriminant quadratic form | library |
| PAPER-CHARLES-16/32 | Discriminant under a full sublattice | library |
| PAPER-CHARLES-16/33 | Even-overlattice isotropy criterion | library |
| PAPER-CHARLES-16/34 | Corrected nonisotropic Mukai discriminant formula | missing |
| PAPER-CHARLES-16/35 | Hilbert-square counterexample to integer multiplier | missing |
| PAPER-CHARLES-16/36 | Rank-three lattice Λ₂d | missing |
| PAPER-CHARLES-16/37 | Nikulin primitive embedding criterion in signature (2,1) | missing |
| PAPER-CHARLES-16/38 | Congruence transport from a primitive initial embedding | missing |
| PAPER-CHARLES-16/39 | Cyclic gluing-quotient transport | missing |
| PAPER-CHARLES-16/40 | Generator rescaling congruence | missing |
| PAPER-CHARLES-16/41 | Norm-two Mukai vector and positive orthogonal class | missing |
| PAPER-CHARLES-16/42 | Zarhin analogue over arbitrary fields | missing |
| PAPER-CHARLES-16/43 | Prime-to-n positive and ample classes | missing |
| PAPER-CHARLES-16/44 | Witt lifting of the Zarhin triple | missing |
| PAPER-CHARLES-16/45 | Brauer obstruction killed by a zero-cycle degree | planned |
| PAPER-CHARLES-16/46 | Hilbert-square descent exponent | missing |
| PAPER-CHARLES-16/47 | Six-dimensional descent variant | missing |
| PAPER-CHARLES-16/48 | Positive-square K3 classes can be made nef | missing |
| PAPER-CHARLES-16/49 | K3 nef Riemann–Roch and fixed components | missing |
| PAPER-CHARLES-16/50 | K3 birational boundedness at fixed positive square | missing |
| PAPER-CHARLES-16/51 | Finite geometric K3 classes at fixed positive square | missing |
| PAPER-CHARLES-16/52 | Uniform extension killing the geometric NS action | missing |
| PAPER-CHARLES-16/53 | Finite forms of a K3 surface in odd characteristic | missing |
| PAPER-CHARLES-16/54 | Positive integral IHS class implies projectivity and bigness up to sign | missing |
| PAPER-CHARLES-16/55 | Local Torelli and rank-one deformation | missing |
| PAPER-CHARLES-16/56 | Kollár–Matsusaka boundedness used here | planned |
| PAPER-CHARLES-16/57 | Finite polarized deformation representatives | missing |
| PAPER-CHARLES-16/58 | Uniform birational sections in a fiberwise-big family | planned |
| PAPER-CHARLES-16/59 | Orthogonal IHS period domain | missing |
| PAPER-CHARLES-16/60 | Existing polarized Hodge period-domain points | library |
| PAPER-CHARLES-16/61 | Polarized monodromy is arithmetic | missing |
| PAPER-CHARLES-16/62 | Baily–Borel algebraicity | planned |
| PAPER-CHARLES-16/63 | Family period map and its algebraicity | missing |
| PAPER-CHARLES-16/64 | Borel algebraicity input | planned |
| PAPER-CHARLES-16/65 | IHS global Torelli in parallel-transport scope | missing |
| PAPER-CHARLES-16/66 | Surjectivity and algebraized period-covering families | missing |
| PAPER-CHARLES-16/67 | Birational IHS Picard and section transport | missing |
| PAPER-CHARLES-16/68 | Weak birational Matsusaka for IHS varieties | missing |
| PAPER-CHARLES-16/69 | Birationally bounded IHS family | missing |
| PAPER-CHARLES-16/70 | Admissible triple | missing |
| PAPER-CHARLES-16/71 | Strong admissibility | missing |
| PAPER-CHARLES-16/72 | Superspecial K3 surface | missing |
| PAPER-CHARLES-16/73 | Smooth polarized deformation of a nonsuperspecial K3 | missing |
| PAPER-CHARLES-16/74 | Obstruction-killing lift of a moduli line bundle | missing |
| PAPER-CHARLES-16/75 | Zarhin fourfolds are strongly admissible | missing |
| PAPER-CHARLES-16/76 | Full Clifford algebra | library |
| PAPER-CHARLES-16/77 | Kuga–Satake Hodge construction | missing |
| PAPER-CHARLES-16/78 | Spin level and orthogonal Shimura data | missing |
| PAPER-CHARLES-16/79 | Descent of the IHS orthogonal period map | missing |
| PAPER-CHARLES-16/80 | Integral Kuga–Satake mapping | missing |
| PAPER-CHARLES-16/81 | Clifford-equivariant étale comparison | missing |
| PAPER-CHARLES-16/82 | Primitive filtered crystalline Kuga–Satake embedding | missing |
| PAPER-CHARLES-16/83 | Good-prime integral orthogonal model and finite KS map | missing |
| PAPER-CHARLES-16/84 | Finite primitive crystalline realizations over a fixed KS variety | missing |
| PAPER-CHARLES-16/85 | Special endomorphisms identify the primitive NS lattice | missing |
| PAPER-CHARLES-16/86 | Finite NS lattices for strongly admissible triples | missing |
| PAPER-CHARLES-16/87 | Finite integral lattices of bounded rank and discriminant | missing |
| PAPER-CHARLES-16/88 | Corrected unpolarized K3 finiteness | missing |
| PAPER-CHARLES-16/89 | Unbounded polarizations defeat the printed finiteness conclusion | missing |
| PAPER-CHARLES-16/90 | Tate conjecture for K3 divisors | planned |
| PAPER-CHARLES-16/91 | Tate–Brauer finiteness criterion | missing |
| PAPER-CHARLES-16/92 | Arithmetic transcendental ℓ-adic lattice | missing |
| PAPER-CHARLES-16/93 | ℓ-adic B-fields and Kummer Brauer classes | missing |
| PAPER-CHARLES-16/94 | Rational exponential Mukai transform | missing |
| PAPER-CHARLES-16/95 | Corrected integral twisted Mukai lattice | missing |
| PAPER-CHARLES-16/96 | Failure of the literal integral-preimage definition | missing |
| PAPER-CHARLES-16/97 | Fixed-determinant twisted sheaf stack | missing |
| PAPER-CHARLES-16/98 | Twisted Chern character and Mukai vector | missing |
| PAPER-CHARLES-16/99 | Exact geometric Brauer order gives automatic stability | missing |
| PAPER-CHARLES-16/100 | Integral twisted vectors are realized by perfect complexes | missing |
| PAPER-CHARLES-16/101 | Isotropic twisted K3 moduli gerbe | missing |
| PAPER-CHARLES-16/102 | Universal twisted Fourier–Mukai equivalence | missing |
| PAPER-CHARLES-16/103 | Coprime pairing makes twisted partner fine | missing |
| PAPER-CHARLES-16/104 | Twisted-lattice discriminant | missing |
| PAPER-CHARLES-16/105 | Isotropic Mukai cohomological quotient | missing |
| PAPER-CHARLES-16/106 | Isotropic numerical Mukai map | missing |
| PAPER-CHARLES-16/107 | Primitive isotropic quotient determinant | missing |
| PAPER-CHARLES-16/108 | Discriminant growth formula for twisted partners | missing |
| PAPER-CHARLES-16/109 | Finiteness implies Tate via twisted partners | missing |
| PAPER-CHARLES-16/110 | Frobenius-invariant lattice discriminant bounds | missing |
| PAPER-CHARLES-16/111 | K3 Frobenius semisimplicity | missing |
| PAPER-CHARLES-16/112 | Nonzero transcendental invariants from infinite Brauer | missing |
| PAPER-CHARLES-16/113 | Literal norm-one selection claim needs a square-class argument | missing |
| PAPER-CHARLES-16/114 | Safe norm-representation substitute after quadratic extension | missing |
| PAPER-CHARLES-16/115 | Unit representation over an odd finite field | missing |
| PAPER-CHARLES-16/116 | Hensel root lifting | library |
| PAPER-CHARLES-16/117 | Dirichlet primes in a unit residue class | library |
| PAPER-CHARLES-16/118 | Simultaneous quadratic-residue primes | missing |
| PAPER-CHARLES-16/119 | Simultaneous splitting and congruence prime choice | planned |
| PAPER-CHARLES-16/120 | Primitive isotropic vectors from a B-field | missing |
| PAPER-CHARLES-16/121 | Infinite twisted K3 partner sequence | missing |
| PAPER-CHARLES-16/122 | Unbounded ℓ-discriminant, bounded p-discriminant | missing |
| PAPER-CHARLES-16/123 | Orthogonal positive/negative divisor pair | missing |
| PAPER-CHARLES-16/124 | Fixed-square divisors on twisted partners | missing |
| PAPER-CHARLES-16/125 | Tate for K3 surfaces of Picard rank at least two | planned |
| PAPER-CHARLES-16/126 | Growing-square classes on partners | missing |
| PAPER-CHARLES-16/127 | Polarized partner applicability gate | missing |
| PAPER-CHARLES-16/128 | Special-fiber ampleness from a rank-one projective deformation | missing |
| PAPER-CHARLES-16/129 | Superspecial reduction | missing |
| PAPER-CHARLES-16/130 | Tate for K3 surfaces in characteristic at least five | planned |
| PAPER-CHARLES-16/131 | Power congruence subsequence | missing |
| PAPER-CHARLES-16/132 | Finite-field descent of the rational Tate statement | missing |
| PAPER-CHARLES-16/133 | Lefschetz (1,1) theorem for divisors | planned |
| PAPER-CHARLES-16/134 | Intersection products on smooth projective surfaces | planned |
| PAPER-CHARLES-16/135 | Hodge endomorphisms of abelian H¹ | planned |
| PAPER-CHARLES-16/136 | Degree-two Hodge numbers of Witt-lifted moduli | missing |
| PAPER-CHARLES-16/137 | Finite arithmetic K3 classes at fixed positive square | missing |
| PAPER-CHARLES-16/138 | K3 birational maps are isomorphisms | missing |
| PAPER-CHARLES-16/139 | Surface Riemann–Roch | planned |
| PAPER-CHARLES-16/140 | Surface adjunction | planned |
| PAPER-CHARLES-16/141 | Hodge index theorem | planned |
| PAPER-CHARLES-16/142 | Local unit-norm lift | missing |
| PAPER-CHARLES-16/gluing-overlattice-order | Existing even-overlattice order equivalence | library |
| PAPER-CHARLES-16/gluing-quotient-isometry | Existing discriminant isometry of an even overlattice | library |
| PAPER-CHARLES-16/rank-one-generator | Existing rank-one discriminant generator formula | library |
| PAPER-CHARLES-16/nikulin-embedding-data | Primitive embedding data with complement identification | missing |
| PAPER-CHARLES-16/hyperbolic-genus-uniqueness | Genus uniqueness for a lattice containing a hyperbolic plane | missing |
| PAPER-CHARLES-16/negative-rank-one-complement | Rank-one complement specialization | missing |
| PAPER-CHARLES-16/nonprimitive-obstruction | Counterexample to the arbitrary-sublattice formulation | missing |
| PAPER-CHARLES-16/explicit-primitive-splitting | An explicit split primitive positive-plane carrier | missing |
| PAPER-CHARLES-16/explicit-positive-plane | Positive-definite Gram matrix for the Zarhin plane | missing |
| PAPER-CHARLES-16/explicit-orthogonal-class | Positive class orthogonal to the norm-two vector | missing |
| PAPER-CHARLES-16/explicit-prime-to-n | Prime-to-n orthogonal norm by one explicit choice | missing |
| PAPER-CHARLES-16/finite-quadratic-sums | Two quadratic polynomials over a finite odd field | library |
| PAPER-CHARLES-16/diagonalization | Nondegenerate quadratic forms diagonalize with unit weights | library |
| PAPER-CHARLES-16/discriminant-sum | Existing plain discriminant and its orthogonal-sum law | library |
| PAPER-CHARLES-16/split-criterion | Identity Artin class and complete splitting | library |
| PAPER-CHARLES-16/cyclotomic-frobenius | Arithmetic Frobenius on roots of unity | library |
| PAPER-CHARLES-16/split-local-embedding | A completely split prime gives a Q_l embedding | planned |
| PAPER-CHARLES-16/reciprocal-pair | Reciprocal eigenspaces form a hyperbolic block | missing |
| PAPER-CHARLES-16/reciprocal-discriminant | Discriminant of the squared-isometry fixed space | missing |
| PAPER-CHARLES-16/integral-orthogonal-split | Unimodular sublattices split integrally | missing |
| PAPER-CHARLES-16/unit-representation-lift | Unimodular odd-adic lattices represent units in rank at least two | missing |
| PAPER-CHARLES-16/rank-one-norm | A square discriminant solves the rank-one norm equation | missing |
| PAPER-CHARLES-16/k3-determinant | The geometric K3 pairing has determinant square class minus one | missing |
| PAPER-CHARLES-16/compatible-system-norm | Norm selection from split orthogonal compatible systems | missing |
| PAPER-CHARLES-16/prime-power-residues | Residue squares lift to every prime power | missing |
| PAPER-CHARLES-16/prime-choice-data | The common splitting field for the K3 prime choice | missing |
| PAPER-CHARLES-16/finite-extension-tate-descent | Rational divisor Tate descends along a finite extension | planned |
| PAPER-CHARLES-16/simultaneous-k3-norm | The composed K3 prime choice in characteristic at least five | missing |
| PAPER-CHARLES-16/unit-norm-primitive | Unit norm detects primitive classes and exact quotient order | missing |
