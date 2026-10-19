# Independent review: quadratic arithmetic at dyadic primes

Job: REV-DESIGN-GeometryOfNumbersAndQuadraticArithmeticPartII; issue #3539. Reviewer: Codex, session codex-TVByiz, 2026-10-19. The design was written by a different session, codex-yTJ4HK.

**Verdict: accepted after correction, as a completed target-level planning pass.** All 31 nodes have individual verdicts in the packet: 21 verified and 10 corrected. No node was added. All six layers remain `planned`, none is `closed`, and every implementation status remains `unchecked`. Acceptance does not certify an implementation or discharge G1–G5. PROTOCOL §0 permits prerequisite chains to terminate in recorded gaps at this planning granularity.

## Scope and coverage

I checked the roadmap definition, packet, reader and suggested Lean file together. The six layers cover the symmetric Dedekind tables, local and characteristic-two specializations, completion and rigidity, the quadratic comparison square and total cokernel, and the integer and Eisenstein computations. The order is acyclic; each target has a node, direct prerequisites, a proof outline and a source locator. The missing foundations are named explicitly rather than represented by private Lean carriers.

The extraction inventories agree exactly, including identifiers, with the three original paper-routing packets. All 16 Calmes dyadic items have target mappings. The independent polynomial-lattice and toral-joining proposals preserve respectively 7 and 83 items; every split item has a proposed stage. Their proof development is outside this retained design. The split is a proposal for the maintainer, not a worker-created roadmap registration.

## Sources and independent arithmetic

The principal text read was [Calmès–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle, arXiv:2009.07225v4](https://arxiv.org/pdf/2009.07225v4), dated 27 April 2026, 63 pages. Its SHA256 is `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`. I read every target locator and the proofs they use in §§2.2–2.3, pp. 36–48, and the integral GW discussion at the start of §3.2, pp. 54–55. The packet and reader keep preprint pagination distinct from the Annals citation.

I also read [Wall, *On the classification of hermitian forms I*](https://numdam.org/article/CM_1970__22_4_425_0.pdf), Lemma 1, p. 427, and Theorem 2 with proof, pp. 428–429. The lifting argument concerns quadratic forms and does not divide the full polar by 2. For the henselian step I read [Clausen–Mathew–Morrow, arXiv:1803.10897v2](https://arxiv.org/pdf/1803.10897v2), Remark 5.6, p. 39. The book and approximation proofs not read are listed as gaps below; they are not treated as verified supplier exports. No uncleared book copy was used. All repository statements are paraphrases or independently derived arguments; no source passage or excerpt was introduced.

Each of E1–E3 now has its own `confirmed` verdict and reason:

| Finding | Independent check and consequence |
| --- | --- |
| E1, Example 2.3.14, p. 47 | In the coordinates `u=⟨1⟩`, `v=⟨1,−2⟩`, `c=⟨1,3⟩`, multiplication by `c` has kernel `⟨2u,c⟩`. The proposed `v` is not in that kernel: `cv=4u≠0`. The corrected generator `⟨1,−3⟩=2u+c` does annihilate `c`. |
| E2, Example 2.3.14, p. 46 | Unramifiedness does not imply inertness. The reduction of `t²+t+1` modulo 2 is irreducible, proving the intended Eisenstein conclusion. In contrast, 2 is unramified and split in `Q(√−7)`. |
| E3, Example 2.3.14, pp. 46–47 | Quadratic Arf base change from F2 to F4 is zero, while symmetric rank parity is unchanged. The plane `x²+xy+y²` acquires the nonzero zero `(ζ,1)`. The corrected quadratic table is `[0,0,Z/2,Z/4]`; the symmetric table remains `[Z/4,Z/2,0,0]`. |

For E3 I checked the effect on both altered group entries, rather than just the finite-field arrow. The local Arf-one form `x²+xy+ζy²` has full polar matrix `[[2,1],[1,2ζ]]`. Its signed determinant has norm 21, which is nonsquare in Q2; this separates its order-two symmetric image from the global class `2u`, whose signed determinant has square norm. Thus the degree-zero comparison pullback has trivial kernel. Transferring the polar by `λ(1)=0`, `λ(√−3)=1` gives the displayed four-by-four matrix of determinant 21 and rational diagonalization `⟨1,−1,4,−21/4⟩`. Its Q2 Witt class is `c`, since −7 is a square. The remaining correction is therefore `ann(c)/⟨c⟩≃Z/4`, rather than the intermediate restriction cokernel `Z/4⊕Z/2`. This reasoning uses the exactness contract now explicitly recorded as G5.

I independently ran finite and exact rational calculations: the 32 Q2 coordinates are pairwise distinct under signed-determinant/Hilbert invariants; generator orders, the three products with `c`, its ideal and annihilator, both tensor tests, the local polar coordinate `c+4u`, and the transfer calculation all agree. The reader describes the Hilbert formula, finite square-class enumeration and rational elimination sufficiently to reproduce these checks. For the E8 half-norm refinement, the graph with arms of lengths 2, 4 and 1 gives 136 zeros among 256 binary vectors, confirming Arf 0. These computations check the arithmetic conditional on imported classification; they are not formal proofs.

Publisher access and public version metadata were checked independently. The restricted Annals text was unavailable, so E1–E3 concern **preprint v4 only**. No dedicated correction was found in the recorded searches; that is not a statement about what an unexamined journal version prints. The packet now records the precise version and hash in `sourceVersions`.

## Baseline and ownership

All ten original baseline entries were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Their six cited modules match the shared pinned build byte for byte. I confirmed the full polar convention, native quadratic maps and isometries, Q2 carrier, integral-lattice hypotheses and native additive quotient.

The declaration index records source generators `MonoidHom.range` and `QuotientGroup.mk'`, whereas the quotient expression uses their generated additive declarations `AddMonoidHom.range` and `QuotientAddGroup.mk'`. I retained the indexed source references, explicitly identified the generated declarations in the baseline, and elaborated uses of both additive names. This avoids presenting a multiplicative homomorphism as the additive carrier.

Four exact pinned baseline declarations were added: `AdicCompletion`, `Ideal.quotientMulEquivQuotientProd`, `IsDedekindDomain.HeightOneSpectrum.isAdicComplete_adicCompletionIntegers`, and `IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletionIntegers`. Their source modules and the imported Mathlib finite-place DVR instance were read at the pins and compared with the shared build. In particular, the relevant complete-DVR and residue-field results apply to arbitrary Dedekind domains: they do not require a number field or a finite residue field. The new construction is the finite product comparison via CRT, cofinality and localization, not another completion carrier.

I checked the reviewed GN.2/GN.6 coverage audit and the current read-only roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27`, with current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Completed IntegralLattices and GlobalQuadraticForms were read in full as models; the newer IntegralLattices and the relevant QuadraticFormInvariants layers and library declarations were checked for ownership. Field Witt rings, Q2 classification, transfer, E8 and integral-lattice signature theory are imported. None is replanned as a general theory here.

## Corrections made

1. Corrected the second-residue proof to use the dual lattice modulo the integral lattice. Made the ramification test explicit: the residue arrow for Z→Z[i] at 2 is zero despite the identity residue-field map.
2. Replaced the S-integer stage's supposed general completion output with the four native declarations above. Expanded the product-comparison proof and added extensionality through its component projections, including the empty product.
3. Replaced broad divisor citations with `ArithmeticKTheory:N.2/the-three-classical-rows`. Its general Dedekind exact sequence already covers characteristic 2; the requested extra divisor extension was unnecessary. Distinguished this input and its K0 supplier from N.1's actual S-integer and projective-module comparisons.
4. Resolved the stable spectra dependency to `StableHomotopyKTheory:H.5:spectra` and specified true homotopy groups and distinguished-triangle exact sequences. Clarified the actual K.6 localization and dense-subcategory exports; their Poincaré/completion bridge remains G1.
5. Recorded the additional quadratic-extension Witt exactness as G5/R4. QFI layer 9's transfer and Frobenius reciprocity do not already state that sequence. Attached the gap directly to the restriction target and the DA.5 remaining list.
6. Added the explicit E8 refinement zero count to the integral signature proof. Classified all 19 tests by what they check, without substituting symmetric polar tests for quadratic-refinement tests.
7. Added separate independent verdicts for E1–E3 and preprint-version metadata. Added `neededBy` links to all requests and gaps. Updated the five-gap summaries, stage descriptions/dependencies, reader and roadmap introduction consistently.
8. Made the Lean quotient expression use the explicit additive range and added the surjective-global-image and additive quotient-projection examples. Updated the validation record and supplied all 31 per-node review verdicts.

The four definition/construction nodes have respectively 7, 8, 7 and 7 API items, and 5, 5, 4 and 5 tests. The tests distinguish full-polar regularity, uniformizer parity and ramification, even extension degree, empty completions and the sum of both quotient images. The 29 planets remain central constructions or arithmetic theorems with descriptive names. No source-number-only planet or new placeholder carrier was added.

## Remaining work and handoff

The review job is finished. The maintainer's follow-ups must retain these boundaries:

- **G1:** register the shared Poincaré-category owner and its exact foundations inventory. Classical GN.6 GW localization and ordinary spectra do not supply periodic L-theory, its field identification, controlled completion square or Poincaré–Verdier criterion.
- **G2/R3:** supply and verify global Witt residue kernel exactness, with a genuine number-field extension of GlobalQuadraticForms and a separately registered function-field contract. The existing divisor sequence is already available and must not be planned again.
- **G3:** obtain and verify Wall (1973), *On the classification of hermitian forms III*, Corollary 1, Lemma 1 and Proposition 4, as used in Proposition 2.3.7, pp. 43–44. Isometry lifting alone is insufficient for the full degree-one relation comparison.
- **G4:** supply the precise Popescu/Elkik approximation input used by CMM Remark 5.6, p. 39, including Elkik Theorem 3.15. Prime-to-p K-theory rigidity is a different result.
- **G5/R4:** register a Part II extension under the field-form owner for the quadratic-extension restriction/transfer exact sequence, cited as Lam VII, Theorem 3.5 in Example 2.3.14, p. 47. Its general proof was not read; the explicit Q2 arithmetic was checked conditional on this contract.

The two independent split proposals still need their own design scheduling. No higher-tier result was moved into this roadmap, and no issue or roadmap registration was changed manually. All durable findings and reproduction instructions are in this report, packet and reader; no scratch file is needed for the next worker.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmeticPartII.json`: 31 nodes, 29 API items, 19 tests, 29 planets, 14 baseline entries, 10 requests and 5 gaps; zero errors and zero warnings.
- `lean-check research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmeticPartII.lean`: exit 0 at the pins, 135 lines, 16 `sorry` warnings, no other warnings or errors. Every data definition has a real body. All processes finished.
- Independent arithmetic enumeration and exact rational transfer elimination: passed, including the E8 count.
- Packet-to-reader statements, hypotheses, proof steps, acceptance checks, direct prerequisites, API and tests: exact textual coverage. Routing and split-stage inventory equality: passed.
- Source-issue/version metadata, deliverable-path/JSON/local-path checks and `git diff --check`: passed before submission.
