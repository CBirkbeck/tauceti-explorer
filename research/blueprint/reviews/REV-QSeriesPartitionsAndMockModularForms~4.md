# Independent review of revision 4: QSeriesPartitionsAndMockModularForms

**Verdict: accepted, with in-place corrections.** Claude, session `claude-Lp3n9X`, reviewed [issue #11495](https://github.com/CBirkbeck/tauceti-explorer/issues/11495). This session wrote none of the four blueprint rounds. Revision 4 was written by Codex, session `codex-VN3yOq` (#11492).

The input was commit `1b33e3189`, with packet SHA-256 `09b52f9d707e8197aad2cefb883e53e4be23d0c5bec11a7ba3a1e60ba2b91ded`. The comparison base was the packet as the revision-3 review left it (`0be89c296`). WORKERS.md, PROTOCOL.md (sections 0–8, 11–15 and 18), the expansion protocol, UPSTREAM_GUIDE.md, the revision-4 handoff and the revision-3 review were read before the packet.

| Checked item | Result |
| --- | --- |
| Changed node records | 47 in revision 4, all checked: 44 verified, 3 corrected. One more inherited record was corrected (node 479). |
| The 43 contracts flagged by revision 3 | Every proof route checked; none remains unverifiable |
| Unchanged records | 490, unchanged since revision 3; they keep its per-node verdicts (`reviewHistory`) |
| Supplier requests | All 30 read. The 8 changed and 4 new ones were compared with their suppliers. 2 corrected. |
| Upstream imports | 11 records, compared with TauCetiRoadmap `c4d22422` (its current `origin/main`), the Tau Ceti library `a91d3aa`, and open PRs #446, #1063, #1168 and #1201 |
| Source findings | E629–E632 confirmed at their locators. The E631 paraphrase was corrected. The 89 earlier verdicts are unchanged. |
| New sources | 15 of the 16 new sources fetched, all except Conway–Norton, plus the Gasper and Borcherds copies; every SHA-256 matches the recorded one |
| Checks | `check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings. `check_sorry_data.py` passes. `lean-check`: exit 0, with only the nine expected warnings for admitted proofs. |

## How the replacement routes were checked

Wherever a revised contract makes a finite or computable claim, an independent calculation was written and run. These calculations use exact rational arithmetic where they can, and double precision otherwise. They are diagnostics of the stated formulas, not proofs.

**QM.2: Dedekind phases, the Lehmer forms and the Selberg bridge (nodes 150–155, 488, 490, 522).** The Jacobi-symbol form of exp(πi s(h,k)) was checked for all k < 60, |h| ≤ 2k and three inverse lifts, in both the odd and the even formula. The identities behind the proof also hold for k < 60: Meyer's identity 12ks = (k−1)(k−2) − 4I, the sign (−1)^I = (h|k) for odd k, and the sawtooth identity for 12khs. Lehmer's f_n and g_n sums agree with the Dedekind definition of A_k(n). The three odd and three even congruences hold for every reduced residue. The two product formulas and the doubling formula hold on their stated ranges, including the sign at λ = 2.

For gcd(k,6) = 1 and k < 120, the root-sum formula A_k(n) = (3|k)√k Σ e_k(r/12) holds, and so does the Fourier phase identity exp(πi s(h,k)) = ε_k(−2h|k) e_k(24⁻¹(h + h̄)) that the new Selberg route rests on. The nonunit vanishing argument, which translates r by k/d, is correct. IntegralLattices 1H gives the sign k²(1−p) + 4kη for q_θ^{(p)}(p^k), with (θ|p) = (−1)^η. For a = (2θ)⁻¹ this agrees with G(a,p^j) = ε(a|p)^j √(p^j), so the imported Gauss-sum service matches the use made of it.

**QM.1 and QM.4: the Weil dictionary and Poisson summation (nodes 125, 300, 303).** The dual Weil T and S matrices were rederived from the index-m theta S-law, together with the branch identity τ^{k−1/2}e(1/8) = τ^k(−iτ)^{−1/2}. The cited suppliers exist with these contracts: MP.4 §4.7 and MP.6 §§6.17–6.20 in the Metaplectic package, and ThetaSeries Layer 1A–1F on TauCetiRoadmap main. ThetaSeries gives the shifted lattice Poisson formula with the positive phase and separate summability statements. Transporting the B-pairing through w = A⁻¹m is correct.

**QM.5: L-functions, Kontsevich and the Poincaré sphere (nodes 357, 359, 375, 381–385).** The following were rederived by hand: γ⁻¹(x+iy) = −a/c + i/(c²y), the cusp identity f(x+iy) = e^{πik/2}(cy)^{−k}h_x(1/(c²y)), the Mellin relation F_x(s) = e^{πik/2}c^{k−2s}H_x(k−s), and the resulting functional equation. The Eichler constant (−2πi)^{−1/2}/Γ(−1/2) and the S-kernel ratio −y^{3/2} were also checked.

For K = 2,…,7, both finite Poincaré-sphere formulas in node 381 were evaluated numerically. They agree with each other and with the Lawrence–Zagier values W(−1) = 2, W(e^{2πi/3}) = −2ξ−1 and W(i) = 1+i. The Dedekind sums, φ = 181/30 and H = 1 are right. In node 382, F(y) = [cosh(4y/15) − cosh(y/15)]/cosh(y/4), the umbral c_r and c₀ = 0 are right.

Node 384's finite-image argument is correct: FXF⁻¹ = Z⁻¹, FZF⁻¹ = X and TXT⁻¹ = e(1/120)XZ, so S and T normalize a finite Heisenberg group whose commutant is the scalars. The vectors Fχ± were checked on all 60 residues.

**QM.5: crank, rank, Choi and R (nodes 392, 393, 396, 399, 400).** Sarma's Theorems 3.1, 3.3 and 4.5 and §5A were read. They give the cusp table used in node 392: orders ≥ 0 at 0, > 0 at 1/m and ≥ 5/11 at m/11. Γ₁(11) has projective index 60, so the weight-one valence degree is 5. The eleven partitions of 6 have pairwise distinct cranks mod 11, so ORD ≥ 6, which proves vanishing. Garvan v2 §6.3 gives ORD ≥ 2 > 1 at p = 5 and ORD ≥ 3 > 2 at p = 7. The cusp sets of Γ₁(5) and Γ₁(7) are as stated.

The generic Choi identity, in exactly the normalization of node 399, holds to about 10⁻¹⁵ at three generic points. The R-dissection of node 400 holds numerically for k = 2,…,5. McLaughlin Proposition 3.1 (3.5), Chen–Fu Proposition 3.1 (3.3) and Bringmann–Folsom Proposition 2.3 are at the cited places.

**QM.5: the trace chain (nodes 406–413).** H(τ+1) = diag(1,−i)H and H(−1/τ) = τ^{3/2}e(1/8)FH were rederived from the theta, eta and E₄ laws. The contraction Σ H_μΘ_μ vanishes identically, and the bracket constant is −8. The square-index corrections were checked against actual traces at n = 4, using t(16) = 287244, t(15) = −192513, t(12) = 53008 and t(7) = −4119. The two sides of the C₁ identity agree at 16560, and Σ r² t(16 − r²) = −17552 = −240σ₃(4) − 32.

**QM.6: the Lie quotient and the Borcherds presentation (nodes 418, 445, 447, 452–455, 458).** The arbitrary-ring quotient is right: the anticommutative Leibniz bracket on V/DV, the central square submodule killed by 2, and the zero-mode action that factors through Q/A. The reduced neutral fermion is a valid counterexample: a₀a = 1, and 1 ∉ DV by degree.

Jurisich's exposition, Theorem 1.11 with Lemmas 1.12–1.14 (pp.13–14) and §§3.2–3.3, was read. The minimal-radical-degree argument in node 445 is correct. It also handles multiples kα_i with a_ii = 0 and k > 1, which the exposition's Lemma 1.14 passes over. The Monster-specific nodes use the restricted free-subalgebra theorem only where the pairings between distinct imaginary simple roots, −(m+n), are negative.

**QM.6: j, Hecke operators and moonshine-type groups (nodes 459, 462, 464, 465, 469).** The cited JInputs declarations exist in Tau Ceti `a91d3aa`, `JInputs.lean` lines 81–319, and not at the pin, as the node says. The all-matrix Hermite coset argument and the coefficient formula are correct for every m. In node 469, the finite-index ball argument, the passage to parabolic powers and the width-one translation predicate are correct. FuchsianOrbifolds Layer 8 appears only in open PR #1168 (README line 1186). The node's local argument does not depend on it.

**QM.6: the Monster (nodes 475, 476).** The finite data were checked exactly:

- The 7×7 character matrix has determinant 35672555520 = 2²²·3⁵·5·7.
- The four trace vectors are exactly χ₁+χ₂, χ₁+χ₂+χ₃, 2χ₁+2χ₂+χ₃+χ₄ and 4χ₁+5χ₂+3χ₃+2χ₄+χ₅+χ₆+χ₇. Their degrees are 196884, 21493760, 864299970 and 333202640600.
- The six odd columns equal the q¹, q², q³ and q⁵ coefficients of 1/η_g for the frame shapes 3¹²/1¹², 5⁶/1⁶, 7⁴/1⁴, 9³/1³, 13²/1² and 15²/3², which match Borcherds §9.

Höhn–Seysen Theorem 2.16 and Proposition 2.18 (pp.13–15) were read. They are stated for V♮, but their frame and simple-current proof applies verbatim to the framed model built in node 475. CFSGBasicProperties P2G, P2R and P2M (open PR #446, lines 585–725) supply the rational Griess algebra, the Y₄₄₃ identification and the class and representation inputs, as the node uses them.

Cummins–Norton Theorem 1.3 (p.1203), Lemma A.4 and Proposition A.5 (pp.1216–1217) were read in the publisher PDF. Ordinary replicability, together with agreement at the twelve indices 1,2,3,4,5,7,8,9,11,17,19,23, forces T_g = f_g. The route therefore needs no Koike or complete-family input.

## Corrections applied

| Where | Correction |
| --- | --- |
| Request 9 (QT.4) | The request named the nodes `poincare-sphere-wrt`, `poincare-sphere-bernoulli` and `poincare-sphere-ohtsuki`, which do not exist. It now names `lawrence-zagier-radial-limit`, `lawrence-zagier-ohtsuki-expansion` and `poincare-sphere-unified-invariant-radial-limit`, where those proofs actually are. |
| Request 10 (MP.7) | `twisted-l-function-entire`, which does not exist, became `QM.5/twisted-cusp-form-l-function`. |
| Node 418 | The test `charZero_comparison` had kind `comparison`, which is not a unit-test kind (PROTOCOL section 12). It is now `compatibility`. A statement sentence about the earlier draft's claim was replaced by a timeless one. |
| Nodes 475, 476 | The statements named the Frenkel–Lepowsky–Meurman module, while the proofs construct Miyamoto's framed code model and never compare it with FLM's construction. The statements now name the constructed model and the presented-Monster action built there. |
| Node 479 | An inherited `uses` entry cited the nonexistent node `QM.4/fifth-order-shadow`; it now names the place without an id. |
| E631 | Borcherds calls the conjugate group the modular group *corresponding to* the 15D element; he does not say it *fixes* T_15D. The paraphrase now says this. The finding still stands, since translation by 1/3 lies in that group and multiplies (η(3τ)/η(15τ))² by e(−1/3). |
| Bringmann–Folsom source | The title is *On the asymptotic behavior of Kac–Wakimoto characters*, PAMS 141 (2013), pp.1567–1576. |
| QM.6 coverage | Added a granularity refinement: nodes 475 and 476 carry several key constructions inside their proof sketches. These are the framed code algebra and its extension, C₂-cofiniteness and self-duality, the Leech-sector and Griess comparison, the restriction isomorphism, the character certificate and the per-row Hauptmodul certificates. Each should become its own node when the budget allows. The arguments are stated; this is a split, not a gap. |

The reader was updated in the same places. Several other passages addressed the next reviewer, and these now report this review: the introduction, the findings preamble, the four pending verdicts, the "Revision-4 status" lines and the request comparison lines. All 537 node contracts and all 30 requests still appear verbatim in the reader. The suggested Lean file needed no change.

## Source findings

- **E629, confirmed.** On the rendered publisher page 573, both conformal vectors e^±(a) carry a plus sign in front of the exponential pair. They therefore coincide, while Lemma 5.3 needs the sign involution to exchange them.
- **E630, confirmed** as a notational slip. The lemma asserts that the commutator vanishes; the proof writes it as 1.
- **E631, confirmed** with the corrected paraphrase above. The identity f³ = T_{5B}(3τ) − 6 also checks.
- **E632, confirmed** on arXiv v1, p.10. The lemma repeats M(β₁,0), where the next displayed fusion product uses M(β₂,0).

## Remaining work and notes

Two gaps remain open: Hickerson's seventh-order identities and Andrews' fifth-order Eulerian identifications. Six layers are partial and QM.4 is planned, each with a precise remaining list. These are honest and do not block acceptance. No layer is closed, and nothing is claimed formalised.

There are three notes for the maintainer.

- QM.6/lattice-vertex-algebra plans general even-lattice vertex algebras, indefinite ones included. AffineLieAlgebras C7, in open TauCetiRoadmap PR #1201, plans the positive-definite case. When that lands, QM.6 should cite C7 for positive lattices and prove compatibility rather than build them again.
- The Conway–Norton (1979) text was read through a third-party mirror (gwern.net). The publisher DOI is the citation of record.
- `check_errata.py` reports 99 pre-existing errors on this packet, from `sourceVersions` kinds such as `errata search` and `acquisition failure`. The same 99 are present before and after this review. The packet checker does not use them, and they were not changed here.
