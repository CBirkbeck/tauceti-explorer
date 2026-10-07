# REV-FIX-RT-AREA-iwasawa-2~2 — review of the fixes for RT-AREA-iwasawa-2, round 2

Reviewer: Claude, session `claude-D9I0pm`, 7 October 2026 (issue #6219). Reviewed: `FIX-RT-AREA-iwasawa-2~2` (Claude Code, session `claude-6ZAIEy`, issue #6218, pull request #6786), described in `research/blueprint/redteam/RT-AREA-iwasawa-2.fixes-2.md`. This session wrote none of the fix. Input: origin/main `4689b245`.

## Verdicts

| File | Verdict | In one line |
|---|---|---|
| `packets/DirichletPadicLFunctions--L3.json` | **accepted** | Findings /1 and /2 need no change to its nodes; three coverage and gap sentences now point to the follow-up part that plans the rest. |
| `packets/PadicMeasuresIwasawaAlgebras.json` | **needs_changes** | The fix for /4 is right as corrected here. Two things remain, neither of them an error left in the L6 plan: the reader document's L6 section is stale, and the L4 blockers of the packet's own blueprint review are still open. |

Why `needs_changes` for the second packet, exactly:

1. **The reader document.** `research/blueprint/readmes/PadicMeasuresIwasawaAlgebras.md` (at the input commit: line 7, the coverage items of L4 and L6 at lines 81 and 95–103, the register lines 112–148, the L6 section at lines 171–933 and the validation note at 934–938) describes the 25 L6 nodes as the fix wrote them. The packet now has 50 corrected L6 nodes. The reader is not a deliverable of this review, so I could not regenerate it. It has to be regenerated from the packet: the coverage section for L4 and L6, the register lines of the Dasgupta–Kakde items, and one subsection per L6 node.
2. **The packet's own blueprint review.** `REV-PadicMeasuresIwasawaAlgebras` (5 October 2026) sent the packet back with eight acceptance blockers, all in L4. The fix did not touch them (it changed no earlier node) and they remain. They belong to the revision `BP-PadicMeasuresIwasawaAlgebras~2` (#6472), not to a further fix round. An `accepted` verdict here would have put the whole packet live, and marked the whole plan as accepted, on the strength of a review of 25 nodes. The earlier review object, with its 436 per-node rows, is kept verbatim as the last entry of `reviewHistory`.

Nothing else is asked of a further fix round. Earlier fix reviews met the same situation and decided the same way (`K2SymbolsBrauer--T.1`, `GL2ModularityLifting--R22.1`, `ArithmeticKTheory--N.7`). See the first question at the end.

## Summary of the review of finding /4

The fix added 25 L6 nodes for the ring theory of Dasgupta–Kakde, *On the Brumer–Stark conjecture* (arXiv:2010.00657v3): character group rings, the involution #, contragredient duals, quadratic presentations with Lemmas 2.4–2.7, compound matrices and higher adjugates with Lemma 3.9, and transposes with Lemma 6.1 and (171). The work was careful: every excerpt is on the page its locator names, the lemma and equation numbers are those printed in v3, and the main examples are right (I recomputed the index p^{p(p−1)/2} of O[C_p] in the product ∏O, #(R_Ψ/(g − 1)) = p^{p−1}, and the non-Gorenstein example on C_p × C_p). The fixer also followed the verifier's corrected contract where it departed from the red team's (R_Ψ is an image, # is an isomorphism R_Ψ ≅ R_{Ψ^{-1}}, the transpose belongs to a presentation).

The review nevertheless changed every one of the 25 nodes and added 25. Two readings were made, the second by readers who were not shown the first reading's findings: 215 findings in all (12 errors, 92 gaps, 111 minor). The main points:

- **Declarations planned afresh that the pinned libraries already have.** PROTOCOL sections 1 and 15. The character evaluation ev_ψ is `TauCeti.DiagonalizableGroup.point`; the augmentation is `TauCeti.MonoidAlgebra.augmentation`; the involution # with its involutivity is `TauCeti.HopfAlgebra.antipodeAlgEquiv` and `antipode_antipode`; the norm element N_I and the idempotents e_χ are `TauCeti.subgroupCharSum` with `single_mul_subgroupCharSum`; column orthogonality of characters is `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`; the 2×2 case of the compound matrix with Cauchy–Binet is `Matrix.pairMinor` and `Matrix.pairMinor_mul`; the coefficient hypothesis "O contains the values of all characters" is Mathlib's `HasEnoughRootsOfUnity O (Monoid.exponent G)`; presentations by generators and relations are Mathlib's `Module.Presentation`. The nodes now cite these and plan only what is new.
- **Who owns Fitting ideals.** The fix asked the Tau Ceti roadmap StableReduction, Layer 1, for higher Fitting ideals of finitely generated modules with monotonicity, the chain and Fitt⁰ ⊆ Ann. Accepted RS-16 gives that layer the "finite-presentation Fitting-ideal carrier" and leaves "higher-Fitting/order-specific algebra beyond the basic carrier" with L6. The source's own convention is finitely presented modules (Appendix B.2). The request is now for the initial Fitting ideal of finitely presented modules only, and L6 plans the higher Fitting ideals itself (four new nodes).
- **Statements.** Lemma 2.4 had been narrowed to characteristic zero to make the source's proof work; the source's statement is true as printed, and the node now states it in that generality with a complete proof (the flaw in the source's proof is source finding E18). The node for (171) was stated for free presentations; the source uses it over Z[G] for a projective presentation of constant rank, and the node now covers that. The block matrix of Lemma 2.6 had the wrong sign in the statement. A remark that every Z_p[G]-algebra is a finite product of local rings was false. A hypothesis note in the lattice node ("only a domain of characteristic zero with finite residue field is used") was false for power-series coefficients. A few tests were false or vacuous in degenerate cases (the zero ring, Ψ = ∅).
- **Granularity.** This roadmap is planned at lemma level (distance 4; PROTOCOL section 2). Several theorem nodes bundled separately declared assertions, and several non-routine steps had no node. They are split: 25 nodes added.
- **Proof steps.** Many steps used a library fact by description without listing it, and a few named a declaration that does not say what the step needs (for example `Submodule.smithNormalForm` for the count over a PID, the class `IsAdicComplete` for the completeness of a finite free module, the generalised Laplace expansion, which is in neither library). One step written during the first reading cited `AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` in a universe where it does not apply; the second reading caught it. Every named fact is now a prerequisite and a baseline entry read at the pin: the baseline went from 383 to 525 declarations.
- **Source findings.** E17 (Lemma 3.9) is confirmed, with its reason reworded. Three were added: E18 (an error in the proof of Lemma 2.4; the lemma stands), E19 and E20 (two harmless slips).

## Finding by finding

### /1 (medium, missing) — Morita's Γ_p and the Gross–Koblitz formula: fix right, no edit needed in the nodes

**Verdict: the fix is right.** The accepted L3 packet already plans what the verifier's contract asks, and the fixer was right not to reopen its nodes. I read each node the fix report names (all 20 exist in `DirichletPadicLFunctions--L3.json`) against the contract in `RT-AREA-iwasawa-2.review.json`:

| Contract item | Where it is planned | State |
|---|---|---|
| Γ_p on Z_p with unit values, continuity, uniqueness | `morita-natural-values`, `morita-gamma`, `morita-gamma-value-continuous`, `morita-gamma-unique` | in the accepted packet |
| Γ_p(x+1) = −xΓ_p(x) on units, −Γ_p(x) on pZ_p | `morita-gamma-functional-equation` (c(x) = x on units, 1 on non-units), `morita-natural-recurrence` | in the accepted packet |
| tests at positive integers, zero, a unit and a non-unit step | `SuggestedMoritaNatTests.*`, `SuggestedMoritaContinuousTests.*` | in the accepted packet |
| not one analytic function on the closed disc | hypotheses of the Morita nodes | in the accepted packet |
| additive character; π with π^(p−1) = −p | `gross-koblitz-trace-character`, `gross-koblitz-integral-pi-existence`, `-normalized-field-pi` and their uniqueness nodes | in the accepted packet (π for odd p) |
| ζ ≡ 1 + π mod π², (π) = (ζ − 1), dyadic root | `rjw2-gk-root-ideals`, `rjw2-gk-root-congruence`, `rjw2-gk-dyadic-root` | only in the follow-up part L3-2, not yet reviewed |
| negative Gauss sum reconciled with Mathlib's `gaussSum` | `robert-negative-gauss-coefficient-sum`, `robert-series-gauss-comparison`, `gross-koblitz-gauss-pair-comparison` | in the accepted packet |
| q = p^f and prime-to-p denominators explicit | `robert-gross-koblitz-comparison`, `gross-koblitz-denominator-unit` | in the accepted packet |
| the Gauss-sum formula itself | `robert-gross-koblitz-comparison` | planned, conditional on the two requests to PadicDifferentialEquationsAndRigidCohomology RD.6 |

Three statements of the fix report are wrong and are corrected here, in this report only (the fix report is not a deliverable):

- Its table puts `gross-koblitz-gamma-source-product` under "Theorem 1.7 with the source's negative Gauss sum". That node is the Gamma product of the Gross–Koblitz multiplication formula. No L3 node states Gross–Koblitz's Theorem 1.7; the planned theorem is Robert's form, `robert-gross-koblitz-comparison`.
- Its row "The trivial character lies outside Theorem 1.7" names `gross-koblitz-negative-gauss-zero`. In L3 the exponent 0 lies inside the planned range 0 ≤ a < q − 1 (the value there is 1); the excluded endpoint is q − 1 (`gross-koblitz-negative-gauss-card-endpoint`).
- "L3 covers odd p only" is not what the packet says. `robert-gross-koblitz-comparison` is stated for every prime, and its request to RD.6 includes p = 2. What is restricted to odd p is the normalised π and the elementary Gauss pair. The gap of EulerSystemsCyclotomicMainConjecture on `L4/greither-gauss-sum-vectors` stays open because the dyadic comparison is still a request, not because L3 excludes p = 2. There is accordingly no "odd-p scope of the Gross–Koblitz statement" for the L3-2 review to confirm.

**Correction made in the packet.** The accepted L3 packet told a reader that this finding is "only partly discharged" without saying where the rest is planned: the string "L3-2" did not occur in it. I appended one sentence to the coverage item (`coverage[0].remaining[3]`) naming the follow-up part and its three root nodes. No node was changed.

### /2 (medium, missing) — the Ferrero–Greenberg derivative formula: fix right as a handoff; still open until L3-2 is accepted

**Verdict: the handoff is right; the finding is not closed.** Nothing of /2 is in the accepted L3 packet, which says so itself ("remains undecomposed"). Everything is in the follow-up part `DirichletPadicLFunctions--L3-2.json` (12 nodes `rjw2-fg-*` and `rjw2-ferrero-greenberg`, all present), which belongs to the same layer and awaits `REV-DirichletPadicLFunctions--L3-2` (#6297). That is where the issue assigned it. The finding closes when that part is accepted.

**Correction made in the packet.** As for /1: `coverage[0].remaining[4]` and the gap "Ferrero–Greenberg derivative formula remains undecomposed" now name the follow-up part and its nodes and say that the finding stays open until that part is accepted.

**For the L3-2 review (#6297).** The fix report says the L3-2 nodes "match the contract of round 1 and of the verdict". Three points do not yet match, and its review should settle them:

1. *Range.* The verdict keeps "the general statement only with its correction term and source range". Ferrero–Greenberg's Proposition 1 is for odd p with p ∤ N; `rjw2-ferrero-greenberg` is stated for every prime ("p is any prime") on the strength of Zhao, §4. Either Zhao proves the case p = 2 with ω_2 of conductor 4, or the four nodes `rjw2-ferrero-greenberg`, `rjw2-fg-exceptional-zero`, `rjw2-fg-exceptional-derivative`, `rjw2-fg-nonvanishing` are restricted to odd p and the dyadic case gets its own node. The fixer raised this and did not judge it; neither have I read Zhao.
2. *Source.* The accepted L3 gap asks the follow-up to "read the exact source". Ferrero–Greenberg, Invent. Math. 50 (1978), is not among the five sources of L3-2.
3. *Convention.* No node compares the branch L_p(θ, s) used there with Ferrero–Greenberg's own function and derivative coordinate, which the verdict asks to "state and compare explicitly".

The formula in L3-2 is also conditional on six requests and three gaps of that packet.

### /3 (high, missing) — the classical log-syntomic package: carried, with two qualifications

**Verdict: carried elsewhere, as the issue assigns; no file under review is concerned.** `PadicHodgeRegulators--D.1.json` has the nodes `D.2/log-syntomic-complex` and `D.2/fontaine-messing-kato-period-map` and a request to `CohomologyComparisons:CP.4` that routes the integral and open construction to an early prefix of CohomologyComparisons Part II, as the fix report says. Two things in the fix report need qualifying:

- The node it cites as "preserving the interfaces without claiming ownership" still claims it: `D.2/log-syntomic-complex`, second `uses` entry, reads "the log-syntomic package (…) owned by this roadmap and imported by D.2 and D.5". The verifier rejected exactly that ownership. The sentence the fix report quotes as being in the nodes' annotations is in the packet's `restructure[0].detail`.
- The carrying job is no longer open: `BP-PadicHodgeRegulators--D.1` is finished and its review (6 October 2026) returned `needs_changes`. The finding now lives in that packet's records (gap, `restructure` entry, request) and has to be taken up by its revision round and by the design of CohomologyComparisons Part II. The queue at the commit I read has no revision job for D.1 yet.

### /4 (medium, missing) — the Dasgupta–Kakde ring theory in PadicMeasuresIwasawaAlgebras L6: fixed, with the corrections recorded here

**Verdict: the fix is right in what it plans and where; its nodes needed the corrections below, all made in place.** The contract of the verdict is met: R_Ψ is the image and not the product; # is an isomorphism R_Ψ ≅ R_{Ψ^{-1}} and an endomorphism only for inverse-stable Ψ; no Gorenstein property is assumed; Lemmas 2.4–2.5 keep the non-zerodivisor and the finiteness; Lemma 2.6 keeps the square presentation of the quotient; the transpose belongs to a presentation and the Fitting identity compares the two coefficient rings; the basic Fitting carrier is imported from StableReduction Layer 1; the transpose reuses the pinned `TauCeti.AuslanderReitenTranspose` and rebuilds nothing of QuiverRepresentations Layer 6; the last step of Lemma 3.9 uses the right-sided identity; the arithmetic stays in IntegralIwasawaTheory I.6/I.7.

**What was checked.**

- *Sources.* The arXiv v3 PDF and TeX source were fetched again (SHA-256 `c1fe1cd8…3b63099` and `4a732681…ff25`, as the packet records), and the authors' copy of 15 February 2022 (`c5b1df5d…d69dcf`). Every excerpt of every L6 node was matched by script to the text layer of the page its locator names (50 nodes, 0 mismatches). The printed numbers were confirmed in the PDF: Lemmas 2.2–2.7, Corollary 2.3, Lemma 3.9, Lemma 6.1, Lemma A.5, Remark A.7, Lemma B.4, (27), (28), (80), (81), (171), §7.2.9.
- *Mathematics.* Every statement, proof step, acceptance item, API item and test of every node, by at least two readers independently. Every concrete example was recomputed exactly: indices and quotient orders for G = C_3, C_5, C_2 × C_2, C_4, C_2 × C_3, C_3 × C_3 over Z[ζ_n]; the kernels of Lemma 2.2 and Corollary 2.3 for every subgroup of five small groups (62 cases for the corollary, with I inside G_p or not); both higher-adjugate identities for all 0 ≤ r ≤ m ≤ 5; Cauchy–Binet for rectangular matrices; the corrected identity of Lemma 3.9; the stable equivalence of transposes on pairs of presentations over Z; Lemma 2.4 on 1,774 cases, 366 of them with det(A) a zero divisor of the product; Fitting ideals of small abelian groups from Smith normal forms.
- *Libraries.* Every `mathlib:` and `tauceti:` reference of the L6 nodes was opened in the pinned trees (Mathlib 082e2d3, Tau Ceti f790474) and its statement compared with the use made of it. The 33 declarations the fix added are exact in name, kind, module and line; two `provides` texts were tightened. Five earlier baseline entries that the L6 nodes cite (`Units.coeHom`, `Module.Dual`, `Module.Free`, `Module.Projective`, `Module.annihilator`) had only been confirmed in the declaration index; their statements were read and their texts rewritten. Neither library has Fitting ideals of modules, compound matrices or a generalised Laplace expansion.
- *Ownership.* Every packet under `research/blueprint/packets/` and `data/blueprints/` was searched for the same objects. No L6 node duplicates a node of another packet. The stage graph was checked: StableReduction Layer 1 has no ancestor in the atlas, the edges from it to L4 and L6 exist already (RS-16), the new prerequisites add no edge and no cycle; only EulerSystemsAndKolyvaginSystems ES.6 consumes L6 at present, and L6 → I.6 is acyclic.
- *Structure, by script.* The prerequisite graph of the packet is acyclic; every node named in a statement or proof step of an L6 node is reachable through its prerequisites; `library.declaration`, API and test names are unique; every definition and construction has uses, an API and at least three tests; there are five planets in L6; no node field contains a job id, a finding id or a reader's name.

**Corrections, by kind.** The per-node list is in the last section.

1. *Reuse of pinned declarations* (first bullet of the summary). The nodes `character-evaluation`, `sharp-involution`, `norm-element-kernel`, `component-character-group-ring`, `compound-matrix` and `presentation-transpose` now build on the pinned declarations and name them as prerequisites; API items that only specialise a pinned declaration say so and have role `compatibility`. `quadratic-presentation` has a compatibility item and test with `Module.Presentation`; `contragredient-dual` with Mathlib's semilinear maps and with the dual of a group-ring module.
2. *The coefficient hypothesis.* "#Hom(G, O^×) = #G" is replaced throughout by `HasEnoughRootsOfUnity O (Monoid.exponent G)`, under which the pinned duality and orthogonality theorems are stated. The hypothesis "#G ≠ 0 in O" was redundant with it and is dropped where it was.
3. *Fitting ideals* (second bullet of the summary). The shared hypothesis sentence of the Fitting nodes now speaks of finitely presented modules and of the imported initial Fitting ideal only. `fitting-extension` assumes A finitely presented and `fitting-fibre-product` A and A′ finitely presented. New nodes: `higher-fitting-ideal` (definition, with API and tests), `relation-minors-add-generator`, `higher-fitting-independence`, `higher-fitting-base-change`. The request (`requests[2]`) is rewritten; see the questions.
4. *Statements corrected or completed.*
   - `quadratic-cardinality` (Lemma 2.4): the source's generality (a finite-index subring of a finite product of PIDs, fields allowed), proved by reduction modulo the finite ideal K = B ∩ ∏(finite factors) and then the source's argument; four lemma nodes carry the steps (`pid-cokernel-cardinality`, `finite-index-cokernel-descent`, `cokernel-modulo-finite-ideal`, `finite-index-subring-nonzerodivisor`).
   - `transpose-higher-fitting` ((171)): presentations by finitely generated projective modules of constant ranks t and t + s over any commutative ring, proved by localisation; the matrix case is `transpose-higher-fitting-free`.
   - `quadratic-presentation-extension` (Lemma 2.6, second assertion): the block matrix is [[ψ_A, −X], [0, φ_C]]; with +X the columns are not relations (Z/9 as an extension of Z/3 by Z/3 is a counterexample).
   - `locally-quadratic-presentation`: over a ring with finitely many maximal ideals a locally quadratic presentation is quadratic (Mathlib's semilocal freeness theorem); the remark about arbitrary Z_p[G]-algebras was false and is replaced by the correct reading of Remark A.7 (base change from Z_p[G]), with a Dedekind counterexample as a test.
   - `character-group-ring-lattice`: the false hypothesis note is removed (for O = Z_p[ζ_p]⟦T⟧, G = C_p and Ψ = {1, ψ} the index is infinite); finiteness is its own node with the hypothesis it needs.
   - `character-group-ring-unit-criterion`: the one-character form needs Ψ nonempty; it is its own node.
   - `component-norm-quotient`: statement, hypothesis and match now agree that the kernel description holds for every subgroup I.
   - `sharp-involution`: the claim "an endomorphism of R_Ψ only when Ψ^# = Ψ" now has a proof step, and the inverse-stable case has an API item.
   - Tests and acceptance items that were false, vacuous or under-specified in degenerate cases (the zero ring, Ψ = ∅, G trivial, unspecified matrix size) are restated; tests that tested nothing (`sharp_full`, `transpose_reuses_AR`, the acceptance items of `quadratic-cardinality` and `fitting-fibre-product`) are replaced by computed instances.
5. *Granularity.* New lemma nodes for assertions that were bundled or for non-routine steps: see the list of added nodes in the last section.
6. *Proofs.* Steps that cited a declaration for something it does not give are rewritten on the declarations that do: the count over a PID (`Submodule.quotientEquivPiSpan` with the Smith coefficients, `LinearMap.associated_det_comp_equiv`, `cardQuot_mul`), adic completeness of R_Ψ (a route valid in every universe), the antipode of O[G] (the Hopf-algebra instance chain), the semilocal freeness theorem (the residue-field bridge), the generalised Laplace expansion and the shuffle sign (planned here, since neither library has them), the transpose (through the API of the pinned file, whose definition is not exposed).
7. *Sources.* Match notes now say when the source states a fact without proof, when a node generalises it, and which source finding concerns it. `character-group-ring-local` says which Ψ §7.2.9 is about. `sharp-involution` cites §1.1, where the involution is defined.
8. *Packet records.* `requests[2]` (need, note, `neededBy`); the coverage items of L4 (`remaining[5]`) and L6 with its gap; the summary; `sources` (what this review read); `sourceIssues` (below); `fixHistory[0].status`. The fix's own count "35 new baseline declarations" (in `fixHistory[0].scope` and in the fix report) should read 33; I left the fixer's record as written.

**Source findings.** All four are against arXiv v3 and the authors' copy of 15 February 2022; the Annals version (197 (2023)) could not be opened (Project Euclid), so none is claimed against the version of record.

| Id | Where | Kind, reach | Verdict |
|---|---|---|---|
| E17 | Lemma 3.9, last display of the proof, PDF p. 26 | gap, the proof | confirmed. The display exhibits det(A′)x as adj_r(A′) applied to an element of the image; the correction uses C_r(A′)·adj_r(A′) = det(A′)·I. The reason is reworded: the image is in fact stable under adj_r(A′), but that needs its own argument. A first justification of the stability proposed during this review was found inadequate by an independent recomputation (A′ = diag(1, 0, 0), r = 2), so the entry asserts only what was verified. |
| E18 | Lemma 2.4, proof, displays (27)–(28), PDF p. 17 | error, the proof | added and confirmed. The proof uses that det(A) is a non-zerodivisor of the product B′, which is assumed only for B. For B = {(a, a mod p)} ⊂ Z × F_p and x = (p, 0) the two ratios in (27) are p, not 1. The lemma itself is true as printed. A finite-field factor does not occur in the paper's uses. |
| E19 | §6.1, after (81), PDF p. 40 | misprint, nothing | added and confirmed. For a module over R_Ψ the dual must be Hom_R(M, R); the dual as literally defined, Hom_{Z[G]}(M, Z[G]), is 0 for such a module. |
| E20 | §2.3, first paragraph, PDF p. 16 | misprint, nothing | added and confirmed. The definition names the module M, the display N. |

Not recorded as a source finding: §7.2.9 says "The ring R = R_Ψ is a complete local Z_p-algebra" for the set Ψ of characters belonging to χ without trivial zero (§7.1), and the paper does not say that this set is nonempty; for Ψ = ∅ the ring is zero. The nodes assume Ψ nonempty. Whether Ψ can be empty in the paper's setting was not decided here, and in that case the paper's inclusion is trivial, so I recorded nothing.

Two corrections to the paper extraction `PAPER-DASGUPTA-KAKDE-23` that the fix report gives are right ((175) should read (171) for items 318 and 332; §7.2.10 should read §7.2.9 for item 202). Six more of its items routed to L6 carry equation numbers that are not those of v3: item 109 (82) → (80); items 111 and 112 "after (83)" → "after (81)"; item 168 (96) → (93); item 326 (155), (156) → (151), (152). The extraction is not a deliverable; the L6 nodes cite the v3 numbers.

### /5 (medium, missing) — finite slope for perfect complexes: carried, but with the red team's wording

**Verdict: carried elsewhere, as the issue assigns; no file under review is concerned.** `LocallyAnalyticDistributions.json` (job `BP-LocallyAnalyticDistributions`, #641, pending) has the L4 coverage item and the gap the fix report quotes. But the coverage item carries the red team's suggested fix, not the verifier's corrected contract: it says to use "the source's nonalternating characteristic-series product" and to "keep solid-module functional analysis outside this layer". The verdict says that the raw product is an auxiliary presentation (the invariant is the spectral support defined from the cohomology sheaves) and that BCGP (2025) §4.6.46 cannot be met by excluding the solid setting. Round 1's corrected contract is only in the fix reports, which that packet does not cite. Whoever takes #641 should read `RT-AREA-iwasawa-2.review.json`, finding /5, before the coverage item.

## The suggested Lean file

`suggested/DirichletPadicLFunctions--L3.lean` is unchanged.

`suggested/PadicMeasuresIwasawaAlgebras.lean`: the L6 block (lines 3175–4047 at the input commit, from the `/-!` of its header to `end L6`) is replaced by a block that follows the corrected packet; sixteen import lines are added; a note on this review is appended after the note of `REV-PadicMeasuresIwasawaAlgebras`. Nothing outside the block is changed.

- **Agreement with the packet**, checked by script against the final packet: all 172 API names, all 50 node declarations and all 57 unit tests of L6 are in the block under the packet's names; every test is an `example` preceded by a line `-- test <name> (<kind>) [<node>]`. Fifteen declarations of the block are named by no packet item: twelve are constructors and fields of the two packet structures, and three are kept for a stated reason: `TauCeti.Module.fittingIdeal` (the stand-in for the Fitting-ideal carrier that L6 imports and does not own), `TauCeti.Iwasawa.charIdempotent` (a stand-in for the L4 character idempotent, which the L4 part of the file does not declare), and `TauCeti.PresentationTranspose.lift_mk` (it pins down a datum left as a placeholder).
- **Reuse.** The block imports and uses the pinned Tau Ceti declarations instead of restating them: `TauCeti.DiagonalizableGroup.point`, `TauCeti.MonoidAlgebra.augmentation`, `Representation.ofLinearCharacter`, `TauCeti.subgroupCharSum`, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, `TauCeti.HopfAlgebra.antipodeAlgEquiv`, `Matrix.pairMinor`, `exteriorPower.map_top_eq_det_smul` and `TauCeti.AuslanderReitenTranspose`.
- **Truth as typed.** The first version of the block had one statement false as typed (`charGroupRing.isUnit_iff_exists` without `Ψ.Nonempty`; Ψ = ∅ refutes it) and several that said less than the packet (existential tests where the packet names the instance, data left as placeholders with nothing to pin them down, a hypothesis `hchar` restating the conclusion of a Mathlib theorem). In the rewritten block every statement was read against its packet item; 57 new or changed declarations and 9 tests were checked a second time by a reader who proved many of them in Lean from the pinned libraries. That check found no false statement and seven places where the Lean said less than the packet item; all are now stated in full.
- **Elaboration.** The shared build at the pinned Mathlib has object files for almost none of Tau Ceti, and the file imports eleven Tau Ceti modules, so **the file was not elaborated with its own import lines**. What was run, with `lean-check` (Lean of the shared build, Mathlib 082e2d3):
  - the L6 block with the Mathlib imports and verbatim copies of the pinned Tau Ceti declarations it uses in place of the Tau Ceti imports: no error; the only warnings are the 175 proof placeholders;
  - the whole file, with every unbuilt pinned Tau Ceti module it needs (28 modules) inlined verbatim in place of the imports: no error and no warning other than proof placeholders (918: 175 in the block, 742 in the earlier part of the file, and one in the inlined copy of the pinned transpose module, where a proof that does not survive inlining was replaced by a placeholder). This is, as far as the reports say, the first elaboration of the whole file since the blueprint review, which could not run one.
- **Left for the L4 revision.** The file has no declaration `TauCeti.Iwasawa.charIdempotent` in its L4 part (the blueprint review lists the name among those missing). The L6 block carries a stand-in under that name, as it does for the Fitting carrier; when the L4 part declares it, the stand-in is to be deleted and no L6 statement changes.
- **Not stated in Lean.** Three packet items are stated in a weaker or different form, and the block says so in its comments: the test `charGroupRing_not_gorenstein` (neither library has a Gorenstein predicate for commutative rings; the example states that R_Ψ/(ζ − 1) is local with maximal ideal of square zero and not principal); two tests of `contragredient-dual` stated as the general identity of which the packet's instance is a case; one test of `higher-adjugate` stated for a general 3×3 matrix, the packet's numbers being the instance.

## What remains, and for whom

- **A further fix round, if the queue creates one from this verdict (`FIX-RT-AREA-iwasawa-2~3`).** One task only: regenerate the L6 part of `research/blueprint/readmes/PadicMeasuresIwasawaAlgebras.md` from the packet as it now stands (the paragraph on this round at line 7, the coverage items of L4 and L6, the register lines of the Dasgupta–Kakde items, one subsection for each of the 50 L6 nodes, source findings E17–E20 and the rewritten request). No node needs further correction that I know of.
- **`BP-PadicMeasuresIwasawaAlgebras~2` (#6472).** The eight L4 blockers of `REV-PadicMeasuresIwasawaAlgebras`, unchanged. It should start from this version of the packet and suggested file. Three L6 nodes (`component-character-group-ring`, `component-group-ring-equiv`, `group-ring-component-decomposition`) rest on the L4 nodes `character-decomposition` and its two lemmas, which that review marked unverifiable and which depend on the open gap "Integral split and Galois-orbit character decomposition"; the L6 nodes use them only for what they state (the idempotents e_ω of O[H] for p ∤ #H, orthogonal with sum 1), under hypotheses that hold here.
- **L6 itself stays partial.** Its `remaining` list names: the Burns–Sakamoto–Sano Gorenstein-order and exterior-bidual targets; Dasgupta–Kakde item 20 (the annihilator of the Pontryagin dual, to be stated on `SelmerIwasawaCohomology:L2/pontryagin-dual`, not on the L6 contragredient dual, which vanishes on finite modules); the Kolyvagin/Rubin items; the second half of item 42 (the ψ-component M_ψ = M ⊗_{Z[G]} O_ψ, planned nowhere); the import by IntegralIwasawaTheory I.6/I.7.
- **`REV-DirichletPadicLFunctions--L3-2` (#6297).** The three points listed under /2, and for /1 the root congruence nodes `rjw2-gk-*`.
- **The revision of `PadicHodgeRegulators--D.1` and `BP-LocallyAnalyticDistributions` (#641).** The points listed under /3 and /5.

## Questions for the orchestrator and the maintainer

1. **What an accepting fix review does to a packet whose own blueprint review sent it back.** `scripts/promote.py` promotes a packet on any `accepted` review by a finished review job of a job that wrote the file, and the queue's `accepted_pass` looks only at `review.status`. Had I written `accepted` here, the packet would have gone live and its plan would have counted as accepted, although `REV-PadicMeasuresIwasawaAlgebras` did not accept it. I kept `needs_changes` and say above that only the reader is asked of the fix. If a scoped acceptance is wanted in such cases, the review object needs a way to say so that promotion understands.
2. **One owner for the higher Fitting ideals.** RS-16 gives StableReduction Layer 1 the finite-presentation carrier and leaves "higher-Fitting … algebra" with L6, and EulerSystemsAndKolyvaginSystems ES.6 already requests Fitt^i from L6. But AdicSpacesPartII (accepted, live) requests the r-th Fitting ideal for every r, with presentation independence, base change, localisation and the chain, from Layer 0 of the same Tau Ceti roadmap, and IntegralHeckeAndGaloisDeterminants IHG.6 plans its own zeroth Fitting ideal for finitely generated modules although RS-16 lists IHG.6 among the former owners. The layer's text ("Fitting ideals far enough to form … Sing(f)") suggests that it will define at least Fitt^1 itself. L6's `higher-fitting-ideal` is written so that it is to be identified with whatever Layer 1 defines; the three records should be reconciled.
3. **The edge L6 → IntegralIwasawaTheory I.6.** Still only a declared need: no I.6/I.7 packet exists (`BP-IntegralIwasawaTheory--I.1` is pending). It is acyclic. I.6 should import `character-group-ring`, `sharp-involution`, `quadratic-presentation`, `locally-quadratic-presentation`, `fitting-extension`, `quadratic-presentation-extension`, `fitting-fibre-product`, `quadratic-cardinality`, `higher-fitting-ideal`, `presentation-transpose`, `transpose-fitting` and `transpose-higher-fitting`.
4. **Finding /3 has no open carrier.** `BP-PadicHodgeRegulators--D.1` is finished with a `needs_changes` review and the queue I read has no revision job for it.
5. **Cross-reference.** `KTheoryLowDegrees:Z.3/compound-matrix-determinant` (Sylvester–Franke) uses that the matrix of ⋀ʲg consists of j×j minors, which is now `Matrix.compound_eq_toMatrix` of `L6/compound-matrix`; the L6 node records the use, and Z.3 should cite L6 when it is next revised (acyclic).
6. **The L3 reader document** still says only that "a follow-up" is needed for /2; the packet now names it. The difference is one pointer sentence.

## Checks run

- `python3 scripts/check_blueprint.py` with the pinned declaration index: `PadicMeasuresIwasawaAlgebras.json` 0 errors, 0 warnings (486 nodes, 525 baseline declarations); `DirichletPadicLFunctions--L3.json` 0 errors, 26 warnings (API outlines of fewer than three items, as before this review).
- `scripts/check_errata.py` (`check_issues`, `versions_checked`) on the packet's source findings: no problem reported.
- Excerpts of the L6 nodes against the PDF text of the cited pages: 50 nodes, 0 mismatches.
- Graph and naming checks listed under /4.
- The L3 packet: nodes, baseline, requests and source findings are identical to origin/main; only two coverage sentences, one gap sentence and the review objects differ.
- `lean-check` on the L6 block and on the whole suggested file, in harnesses that inline the pinned Tau Ceti modules the shared build lacks: no errors, proof placeholders the only warnings (details in the section on the suggested Lean file). The file with its own `import TauCeti.…` lines was not compiled: no build of the pinned Tau Ceti exists on the machine.
- Coverage script, packet against block: API 172/172, node declarations 50/50, unit tests 57/57.

## Sources read, with versions

| Source | What was opened | SHA-256 | Read |
|---|---|---|---|
| Dasgupta–Kakde, *On the Brumer–Stark conjecture*, arXiv:2010.00657v3 (preprint) | https://arxiv.org/pdf/2010.00657v3 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` | 7 October 2026: pp. 15–18, 25–26, 32–34, 40, 43, 49, 84–86, 93–94 |
| the same, TeX source | https://arxiv.org/e-print/2010.00657v3 | `4a73268176e1db3f4071b80368bbdec5440716f4f9ce5cee10157fbadc72ff25` | the corresponding lines |
| the same, authors' copy of 15 February 2022 | https://services.math.duke.edu/~dasgupta/papers/Brumer-Stark.pdf | `c5b1df5da32ea7a30ed49b9ddc71249adb37e318971b0d304584c98d6ef69dcf` | pp. 16–17, 26, 41, for E17–E20 |
| the same, Annals of Mathematics 197 (2023), 289–388 | https://doi.org/10.4007/annals.2023.197.1.5 | not obtained | could not be opened (Project Euclid), 7 October 2026 |
| Mathlib | commit 082e2d37e8b0463410cdb532e111cd43d5a66174 | | declarations cited by the L6 nodes |
| Tau Ceti | commit f790474821cf4256814db967cb154e7af3d0c369 | | declarations cited by the L6 nodes; `content/tau-ceti/StableReduction/README.md` for the request |

Text was extracted with `pdftotext` (poppler), modes `-raw` and `-layout`.

## The L6 nodes, one by one

For each node: the verdict recorded in the packet (`review.checked`), then the findings that concern it, one line each (finding id, severity, first sentence of the claim). Ids: A–F first reading (A, B, C the three groups of nodes, D library citations, E the Lean block, F ownership and the other findings); A–C with numbers above their first-reading range are from the consolidation; G, H2, K2, J2, M2 second reading; L and LC from typing the statements in Lean at the end. The full texts, with evidence and the corrected wording, are not in the repository; every correction they led to is in the packet.

### `character-evaluation` — corrected
Declaration `TauCeti.jointEval` (construction). Fields changed: acceptance, api, hypotheses, library, prerequisites, proofSteps, statement, tests, title.

- A-1 (error): The constructor TauCeti.charEval is a declaration the pinned Tau Ceti library already has, under the name TauCeti.DiagonalizableGroup.point: the node plans to define the same term again under a new name in the same library, and the packet neither cites the …
- A-2 (gap): The injectivity argument uses the second orthogonality relation Σ_{ψ∈Ĝ} ψ(k) = 0 for k ≠ 1 ('by orthogonality on Ĝ (the dual group of G has the same order)').
- A-4 (gap): The node says twice that ev_1 'is the augmentation' (acceptance[0], api charEval_one) but no api item relates it to the augmentation the pinned libraries already have, so a user cannot pass between the two without unfolding (PROTOCOL §4, compatibility).
- D-3 (gap): Step 4 needs the second (column) orthogonality relation Σ_{ψ∈Ĝ} ψ(g)^{-1}ψ(h) = #G·δ_{g,h} and derives it 'by orthogonality on Ĝ (the dual group of G has the same order)', with mathlib:sum_hom_units_eq_zero as the only citation.
- D-15 (gap): The node introduces ev_ψ without relating it to two pinned Tau Ceti notions it specialises (PROTOCOL section 4, compatibility items; section 15).
- E-4 (gap): The hypothesis “#Hom(G, O^×) = #G” (Lean: `hchar : Nat.card (G →* Oˣ) = Fintype.card G`, called `HasEnoughCharacters` in the block header) restates as a raw equation the conclusion of a pinned Mathlib theorem whose hypothesis is the Mathlib class for exactly …
- F-9 (gap): The column orthogonality relation that the injectivity of the joint evaluation rests on (Σ_{ψ∈Ĝ} ψ(σ)^{-1}ψ(g) = #G if g = σ and 0 otherwise) is a built theorem of pinned Tau Ceti, with the Fintype instance on G →* O^× next to it.
- A-25 (gap): Changed judgement. My determinant argument of A-2 is withdrawn: the column orthogonality relation is a built theorem of the pinned Tau Ceti (reader F's F-9, reader D's D-3), which I missed because my index search for orthogonality lemmas was restricted to …
- G-8 (minor): ‘the two characters of C_2’ is not defined in the node's generality (O any commutative ring): the characters of C_2 are the square roots of 1 in O, of which there are four in Z/8 and one in F_2, and in characteristic 2 the ‘sign’ is trivial.
- G-9 (minor): The statement says that ev_ψ ‘is the Tau Ceti declaration TauCeti.DiagonalizableGroup.point ψ … and is not defined again’, while the API plans a declaration TauCeti.charEval for it and five lemmas about it.

### `joint-evaluation-injective` — added
Declaration `TauCeti.jointEval_injective` (lemma). Injectivity of the joint evaluation, promoted from an API item of character-evaluation because other nodes need it; proved from the pinned column orthogonality of characters.

- G-1 (minor): The hypothesis ‘in which #G ≠ 0’ is redundant, and hypotheses[1] (‘this is automatic in characteristic zero’) understates it: for a domain O, HasEnoughRootsOfUnity O (Monoid.exponent G) forces #G ≠ 0 in O in every characteristic.

### `character-group-ring` — corrected
Declaration `TauCeti.charGroupRing` (definition). Fields changed: acceptance, api, hypotheses, prerequisites, proofSteps, tests.

- A-5 (gap): The api list lacks items that the recorded uses and the neighbouring nodes need: (1) the ψ-coordinate as an O-algebra homomorphism R_Ψ → O; (2) the universal property of R_Ψ as a quotient of O[G] and the isomorphism O[G]/ker α_Ψ ≅ R_Ψ; (3) injectivity of R_Ψ …
- A-6 (minor): Three items omit 'G finite, O a domain', and two of them are false as written for a general commutative ring O, which is the generality of the Lean definition and of the neighbouring items R_∅ = 0 and R_{1} ≅ O; a test has to be a precise statement on its own.
- D-2 (minor): Step 1 and the API item charGroupRing.proj_surjective use surjectivity of AlgHom.rangeRestrict.
- G-7 (gap): The API has no surjectivity of the restriction maps, although proofSteps[2] proves it (‘maps R_{Ψ′} onto R_Ψ’) and a recorded use needs it: in the proof of Dasgupta–Kakde Lemma 7.1 (uses[3]) an element y ∈ R_Ψ is lifted to R = R_{Ψ_χ} (‘Let ỹ be any lift of y …

### `character-group-ring-scaled-idempotent` — added
Declaration `TauCeti.charGroupRing.card_smul_single_mem` (lemma). The elements #G·δ_ψ of R_Ψ, promoted from an API item of character-group-ring because the lattice, finite-index and non-zerodivisor nodes need it.

- LC-1 (gap): The packet item (node statement and API item) ends with the consequence that the rest of L6 uses: #G·∏_{ψ∈Ψ} O ⊆ R_Ψ.

### `character-group-ring-lattice` — corrected
Declaration `TauCeti.charGroupRing.free` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement, title.

- A-7 (error): 'Only O a domain of characteristic zero with finite residue field and #Ĝ = #G is used' is false as a description of what the theorem needs: part (ii) fails under exactly these hypotheses, and its own proof step uses that O is a PID and a 'characteristic-zero …
- D-6 (gap): Step (iii) repeats the second orthogonality relation 'by orthogonality over the dual group Ĝ of order #G' and lists only mathlib:sum_hom_units_eq_zero for it; as in D-3 that lemma is the row relation and does not give it; the column relation is pinned in Tau …
- G-3 (gap): Step 2 rests on named facts that are not prerequisites: ‘the rank of submodules of a finite free module over a domain is monotone’ and ‘O^Ψ is free of rank #Ψ’.

### `character-group-ring-finite-index` — added
Declaration `TauCeti.charGroupRing.finite_quotient` (lemma). Split from character-group-ring-lattice: finiteness of (∏O)/R_Ψ.

- A-23 (minor): New. The finiteness hypothesis 'O/(a) is finite for a ≠ 0', which the Lean block carries as an explicit function `hfin` (in two different forms: for natural numbers n in charGroupRing.finite_quotient, for all a in charGroupRing.card_quotient_span), has a …
- G-2 (gap): Step 2 uses a named fact that is not a prerequisite: ‘(#G) is a power of 𝔪_O’ (every nonzero ideal of a discrete valuation ring is a power of the maximal ideal).
- L-7 (minor): 'What is used: G is finite, O is a domain with #G ≠ 0, and O/(#G) is finite': once O/(#G) is assumed finite, #G ≠ 0 is not used for the finiteness of (∏O)/R_Ψ.
- LC-2 (gap): The packet statement says more than finiteness: 'more precisely, the quotient is a quotient of (O/#G)^Ψ'.

### `character-group-ring-nonzerodivisor` — corrected
Declaration `TauCeti.charGroupRing.mem_nonZeroDivisors_iff` (lemma). Fields changed: hypotheses, prerequisites, proofSteps, sources, statement.

- A-8 (minor): The last sentence, 'Multiplication by such x is injective on ∏ O and on (∏ O)/R_Ψ-lifts', has no precise meaning ('(∏ O)/R_Ψ-lifts' is not defined); what Lemma 2.5 uses is the isomorphism (∏ O)/R_Ψ → x(∏ O)/xR_Ψ.
- E-16 (minor): Parts of three theorem nodes are not typed. (a) nonzerodivisor: the Lean gives (non-zerodivisor of R_Ψ) ⟺ (all ψ(x) ≠ 0) but not the third condition “x is a non-zerodivisor of ∏ O”, which is the form Lemma 2.5 uses.
- LC-3 (gap): The second sentence of the packet statement is not typed anywhere in the block: for a non-zerodivisor x, multiplication by x is injective on ∏O and induces an isomorphism of O-modules (∏O)/R_Ψ → x(∏O)/xR_Ψ ('as used in Lemma 2.5').

### `norm-element-kernel` — corrected
Declaration `TauCeti.charGroupRing.ker_proj_eq_span_norm` (theorem). Fields changed: hypotheses, prerequisites, proofSteps, sources, statement.

- D-4 (gap): The norm element N_I = Σ_{σ∈I} σ (here, in component-norm-quotient, and in the suggested Lean as `∑ σ : I, MonoidAlgebra.of O G σ`) and the idempotent e_χ = (#G′)^{-1}Σ_{a∈G′} χ(a)^{-1}a of component-character-group-ring are re-introduced, although pinned Tau …
- F-8 (gap): The norm element N_I = Σ_{σ∈I} σ is a built declaration of pinned Tau Ceti which the accepted paper extraction already records as the library owner of this object; the new nodes define it afresh and do not cite it.

### `character-idempotent-evaluation` — added
Declaration `TauCeti.charEval_charIdempotent` (lemma). Split from component-character-group-ring: ψ(e_χ) is 1 or 0; needed also by component-norm-quotient.

- L-1 (gap): The L6 nodes character-idempotent-evaluation, component-character-group-ring, component-group-ring-equiv, group-ring-component-decomposition and component-norm-quotient take e_χ to be 'the character idempotent of …

### `component-character-group-ring` — corrected
Declaration `TauCeti.charGroupRing.ker_proj_component` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement, title.

- D-22 (gap): The node rests step 4 on PadicMeasuresIwasawaAlgebras:L4/character-decomposition and its two splits, and uses three facts that those nodes do not state.
- E-11 (gap): `componentEquiv … : charGroupRing Ψ_χ ≃ₐ[O] MonoidAlgebra O Gp := sorry` asserts only that some O-algebra isomorphism exists; the packet statement is that R_χ ≅ O[G_p] “with g = g′g_p acting by χ(g′)g_p”.
- A-30 (minor): On D-22 and the lead's decision: implemented, with one change of formulation.
- G-5 (gap): The evaluation ‘ψ(e_χ) = 1 for ψ ∈ Ψ_χ and 0 for ψ ∈ Ĝ ∖ Ψ_χ’ is a separate fact with its own proof (step 2, a named library lemma) and a second consumer: component-norm-quotient step 1 cites it ‘(…/component-character-group-ring)’.

### `component-group-ring-equiv` — added
Declaration `TauCeti.charGroupRing.componentEquiv` (construction). Split from component-character-group-ring: the isomorphism R_{Ψ_χ} ≅ O[G_p]_χ, as a construction with API and unit tests.

- G-4 (gap): The node's declaration TauCeti.charGroupRing.componentEquiv is data (an O-algebra equivalence R_{Ψ_χ} ≃ O[G_p]), and its statement introduces a second datum, the homomorphism π_χ : O[G] → O[G_p]; yet the node has kind ‘theorem’ and therefore no uses, no API …
- L-2 (minor): The two degenerate items are not well typed as written: 'π_1 is the identity of O[G_p]', 'componentEquiv is the inverse of equivGroupRing', 'O[G_p] = O' and 'componentEquiv(α_Ĝ(x)) = x' identify O[G_p] with O[G] (resp.
- LC-7 (gap): The packet test has two instances: (i) for χ² ≠ 1, π_{χ⁻¹}(e_χ) = 0 and π_χ(e_χ) = 1; (ii) π_χ is not injective whenever G′ ≠ 1 (it kills 1 − e_χ ≠ 0).

### `group-ring-component-decomposition` — added
Declaration `TauCeti.charGroupRing.bijective_proj_components` (theorem). Split from component-character-group-ring: O[G] ≅ ∏_χ R_{Ψ_χ}.

- G-12 (minor): ‘The sets Ψ_χ, χ ∈ Ĝ′, partition Ĝ’ is proved only as far as ‘every ψ restricts to exactly one χ’ (disjoint with union Ĝ).
- LC-4 (gap): The packet statement has three assertions: the e_χ ∈ O[G] (χ ∈ Ĝ′) are pairwise orthogonal with sum 1; x ↦ (α_{Ψ_χ}(x))_χ is an isomorphism; the sets Ψ_χ partition Ĝ.

### `component-norm-quotient` — corrected
Declaration `TauCeti.charGroupRing.ker_proj_component_norm` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- A-20 (minor): The match note does not say that the source gives no proof of Corollary 2.3, nor that the node's kernel statement is more general than the source's (any subgroup I instead of I ⊆ G_p); the generalisation is recorded only in hypotheses[1].
- G-6 (minor): The statement is made for ‘a subgroup I ⊆ G_p’, while hypotheses[1] (‘The kernel description holds for any subgroup I’) and the match note (‘the steps above deduce it … for an arbitrary subgroup I’) say that the node proves it for every subgroup of G.

### `character-group-ring-unit-criterion` — corrected
Declaration `TauCeti.charGroupRing.isUnit_iff` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- A-9 (gap): The first step proves by hand a statement the pinned Mathlib has, and names none of the facts it uses: integrality of the finite O-algebra ∏ O (IsIntegral.of_finite) and the fact that an injective integral ring homomorphism reflects units …
- A-10 (minor): The node's first claim (units are detected by all characters, for every Ψ, also when R_Ψ is not local) is sourced only to §5.1, where R = O[G_p]_χ is local and the source's reason is 'local homomorphisms of local rings'.
- D-9 (gap): Step 1 re-proves, without citing it, a Mathlib theorem: an injective integral ring homomorphism reflects units.
- E-1 (error): The Lean statement is false as typed: it has no hypothesis that Ψ is nonempty.
- H2-1 (gap): Step 1 passes from 'each element of ∏_{ψ∈Ψ} O is integral over O (IsIntegral.of_finite)' to 'hence over R_Ψ' without naming the fact that does it.
- H2-2 (minor): Two locality remarks are stated without the condition that makes them true.

### `character-group-ring-unit-one-character` — added
Declaration `TauCeti.charGroupRing.isUnit_iff_exists` (lemma). Split from character-group-ring-unit-criterion: the one-character form, which needs Ψ nonempty inside one Ψ_χ.

### `character-group-ring-local` — corrected
Declaration `TauCeti.charGroupRing.isLocalRing` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement, title.

- A-12 (gap): The completeness half of the theorem rests on three facts that are neither listed prerequisites nor single declarations of the pinned libraries: (a) 'a finite free module over the complete local ring O is 𝔪_O-adically complete and separated'; (b) the passage …
- A-13 (minor): '(for instance R_χ itself, or R_χ/N_I)' offers R_χ/N_I as an instance without restriction, but for I = 1 it is the zero ring (Ψ = ∅, component-norm-quotient acceptance[0]), which the hypothesis 'nonempty Ψ' excludes.
- D-10 (gap): Step 4 ('A finite free module over the complete local ring O is 𝔪_O-adically complete and separated') is used as a known fact, with mathlib:IsAdicComplete as the only library prerequisite.
- H2-3 (gap): The node still bundles four declarations under the single name TauCeti.charGroupRing.isLocalRing: (i) R_Ψ is a local ring, (ii) its maximal ideal is ev_ψ^{-1}(𝔪_O), (iii) its residue field is k, (iv) each ev_ψ : R_Ψ → O is a local homomorphism.

### `character-group-ring-maximal-ideal-power` — added
Declaration `TauCeti.charGroupRing.exists_maximalIdeal_pow_le` (lemma). Split from character-group-ring-local: 𝔪_Ψ^N ⊆ 𝔪_O R_Ψ ⊆ 𝔪_Ψ.

- L-6 (minor): In the three nodes the hypothesis 'χ ∈ Ĝ′ and nonempty Ψ ⊆ Ψ_χ' enters only through 'R_Ψ is a local ring' (and, for the residue field, 'ev_ψ is a local homomorphism').

### `character-group-ring-eval-local-hom` — added
Declaration `TauCeti.charGroupRing.isLocalHom_eval` (lemma). Split from character-group-ring-local: each evaluation R_Ψ → O is a local homomorphism.

### `character-group-ring-residue-field` — added
Declaration `TauCeti.charGroupRing.bijective_residueFieldMap_eval` (lemma). Split from character-group-ring-local: the residue field of R_Ψ is k.

### `character-group-ring-adic-complete` — added
Declaration `TauCeti.charGroupRing.isAdicComplete` (theorem). Split from character-group-ring-local: noetherian and adically complete; proof through pinned declarations that hold in every universe.

- A-29 (minor): On reader D's D-10: the bridge IsAdicComplete.map_algebraMap_iff is adopted.
- H2-5 (error): Step 3 applies AdicCompletion.ofTensorProductEquivOfFiniteNoetherian to the O-module R_Ψ.
- H2-6 (minor): Step 1 passes from 'finite O-module' to 'noetherian ring' without naming the library fact, which is not a prerequisite; freeness (the lattice theorem) is not what the step uses.
- H2-7 (minor): The node bundles three declarations under TauCeti.charGroupRing.isAdicComplete: R_Ψ is a noetherian ring; the sandwich 𝔪_Ψ^N ⊆ 𝔪_O R_Ψ ⊆ 𝔪_Ψ; R_Ψ is 𝔪_Ψ-adically complete.

### `character-group-ring-index` — corrected
Declaration `TauCeti.charGroupRing.card_quotient_span` (theorem). Fields changed: hypotheses, prerequisites, proofSteps, sources.

- A-15 (gap): Two named facts are used and not listed. (a) Finiteness of O/(a) for a ≠ 0 in a discrete valuation ring with finite residue field: lattice (ii) ('(O/#G)^Ψ, which is finite because … its residue field is finite') and the index lemma (finiteness of O_Ψ/xO_Ψ, …
- D-20 (gap): Step 3 uses '#(O/(ab)) = #(O/(a))·#(O/(b)) for nonzero a, b in the DVR O' as a known fact; the node has no library prerequisite.
- A-28 (minor): On reader D's D-20, after reading the pinned source: adopted, with two additions.
- H2-8 (gap): Finiteness of O/(a), a ≠ 0, rests in step 2 on the unnamed library fact 'a nonzero ideal of a discrete valuation ring is a power of 𝔪_O', which is not a prerequisite; and the listed prerequisite mathlib:Ring.HasFiniteQuotients is used by no step.
- H2-9 (minor): The match says only that 'the non-zerodivisor transfer to O_Ψ is made explicit'.
- J2-5 (minor): finite-index-cokernel-descent states its case m = 1 ('#(B′/dB′) = #(B/dB) for every d ∈ B that is a non-zerodivisor of B′') and that is exactly step 2 of the node character-group-ring-index (Lemma 2.5: B = R_Ψ, B′ = O_Ψ, d = x); the source itself says 'We …

### `sharp-involution` — corrected
Declaration `TauCeti.charGroupRing.sharpEquiv` (construction). Fields changed: api, hypotheses, library, prerequisites, proofSteps, sources, tests.

- A-16 (gap): Two api items restate declarations of the pinned Tau Ceti library without citing them: TauCeti.sharpAlgEquiv ('# as a self-inverse O-algebra automorphism of O[G]') is TauCeti.HopfAlgebra.antipodeAlgEquiv for A = O[G], and TauCeti.sharp_sharp is …
- A-17 (gap): The compatibility test does not test the construction. Its packet statement 'Ĝ^{-1} = Ĝ, so R_Ĝ^# = R_Ĝ' is an identity of sets of characters, and its Lean form `(Set.univ : Set (G →* Oˣ))⁻¹ = Set.univ := Set.inv_univ` mentions neither `sharp` nor …
- A-18 (gap): The source's and the node's assertion that # : R_Ψ → R_{Ψ^#} and # : R_{Ψ^#} → R_Ψ are mutually inverse has no api item: the api gives the equivalence in one direction and its value on α_Ψ(x), but nothing says that its inverse is again induced by #.
- A-19 (minor): The single source entry (§6.1) does not contain the definition of #: the source defines the involution in §1.1, on Z[G], and §6.1 only refers to 'the involution # on O[G]'.
- D-5 (gap): Step 1 says 'MonoidAlgebra.antipode_single gives g ↦ g^{-1}'.
- E-2 (gap): The node plans as new API what the pinned Tau Ceti already has for every commutative Hopf algebra: the antipode as an involutive algebra equivalence and its involutivity.
- E-3 (minor): `sharp_of` is tagged `@[simp]` with left side `sharp (MonoidAlgebra.of O G g)`, which is not in simp-normal form: Mathlib's simp lemma `MonoidAlgebra.of_apply` rewrites `of g` to `single g 1` first, so the lemma never fires and plain `simp` cannot prove …
- A-27 (gap): New. The statement asserts 'It is an endomorphism of R_Ψ only when Ψ^# = Ψ', and no proof step proved it.
- H2-10 (gap): Step 4 proves 'ker α_Ψ determines Ψ' by 'row orthogonality' applied to Σ_g ψ′(g)^{-1} g for a character ψ′ outside Ψ, and steps 2–3 use the character evaluations (ev_ψ(g) = ψ(g), linearity); neither the node that owns row orthogonality nor the node that owns …
- H2-11 (gap): The statement asserts 'For R = O[G] … R^# = R' and that # is an endomorphism of R_Ψ when Ψ^# = Ψ, but the API has no item for the inverse-stable case.
- L-3 (gap): The API item sharpAut bundles a definition with two characterising formulas, #(α_Ψ(x)) = α_Ψ(x^#) and (#y)(ψ) = y(ψ^{-1}).
- LC-5 (gap): The packet item characterises the automorphism by two formulas, #(α_Ψ(x)) = α_Ψ(x^#) and (#y)(ψ) = y(ψ⁻¹) (and, for Ψ = Ĝ, the correspondence with # on O[G], which is the first formula for Ψ = univ).

### `contragredient-dual` — corrected
Declaration `TauCeti.ContragredientDual` (construction). Fields changed: acceptance, api, hypotheses, prerequisites, proofSteps, sources, tests.

- B-9 (gap): The construction is not compared with what the pinned libraries already have, and two recorded uses are not served by the API.
- B-10 (minor): The module structure (s·φ)(x) = φ(σ(s)x) agrees with (80), but the node changes the Hom without saying so.
- H2-12 (gap): The API omits what the consuming nodes cite this node for, and the basic element-level interface.
- H2-13 (minor): The node states, as step 5 and as the API items equivDualOfGroupRing and equivDualOfGroupRing_dual, the isomorphism Hom_O(M, O) ≅ Hom_{O[G]}(M, O[G]), f ↦ (m ↦ Σ_g f(gm)·g^{-1}), and attributes it in the API text to 'Dasgupta–Kakde, proof of Lemma A.8', but …
- H2-14 (error): The non-example is false as stated when O is the zero ring: then O[G] = 0 and g^{-1} = g in O[G] for every g, so '(g·id)(1) = g^{-1} ≠ g' fails.
- L-4 (minor): The item states the map and also its inverse ('with inverse φ ↦ (the coefficient of 1 in φ(·))').

### `quadratic-presentation` — corrected
Declaration `TauCeti.QuadraticPresentation` (definition). Fields changed: acceptance, api, prerequisites, proofSteps, sources, tests.

- B-7 (gap): Mathlib at the pin already has presentations of modules by generators and relations (Module.Relations, Module.Relations.Solution, Module.Presentation, with cokernel, direct sum, tensor product, restriction of scalars and the link to Module.FinitePresentation).
- B-15 (minor): Two harmless slips in the passages these nodes cite are not recorded: the definition names the module M and then presents N; and the middle member of (27) is printed with a stray ‘#’ inside the denominator (‘#det(A)B′/#det(A)B’ for #(det(A)B′/det(A)B)).
- D-14 (gap): The node defines presentations by generators and relations from scratch (matrix φ, surjection π, range φ = ker π) and builds finite presentation, transport, cokernel and direct sum for them, without relating them to Mathlib's Module.Relations / …
- E-5 (gap): Mathlib already has presentations of modules by generators and relations, with the constructions this node re-plans (transport along an equivalence, cokernels, finite presentation).
- B2-7 (minor): Changed text. Both non-examples were justified by a Fitting ideal, which by G2(e) would force the two definition nodes to list the Fitting stage as a prerequisite although the definitions do not involve Fitting ideals.
- K2-2 (gap): Three nodes prove a base-change statement by ‘tensoring is right exact’ (quadratic-presentation step 2, higher-fitting-ideal step 8, locally-quadratic-presentation step 5).
- K2-3 (gap): Step 3 and the API item prod_det use that the block-diagonal matrix has determinant det φ·det φ′.
- K2-4 (gap): The statement says that a quadratic presentation is ‘equivalently N ≅ coker(φ)’, and the recorded use ‘§2.3 and §5.1: Lemmas 2.4–2.5 compute orders’ starts from that isomorphism (quadratic-cardinality step 1: ‘N ≅ B^m/AB^m’; the source: ‘so N ≅ B^m/A·B^m’).
- K2-5 (minor): (a) quadratic_baseChange is labelled ‘compatibility’ (agreement with the closest Mathlib or Tau Ceti notion) but compares with no library notion, and as stated (‘(R/(a)) ⊗_R R′ is quadratically presented over R′’) it holds for every definition that has the …
- L-5 (minor): The item ends with a second claim, 'applied to toPresentation it returns (m, φ, π)', that has no item of its own; the file states the construction only.

### `fitting-quadratic` — corrected
Declaration `TauCeti.QuadraticPresentation.fittingIdeal_eq` (theorem). Fields changed: acceptance, hypotheses, proofSteps.

### `higher-fitting-ideal` — added
Declaration `TauCeti.Module.higherFittingIdeal` (definition). New definition: the higher Fitting ideals Fitt^i of a finitely presented module on the imported carrier, which accepted RS-16 leaves with L6 and the first version requested from the Tau Ceti roadmap.

- B2-8 (gap): The object of the new node is requested elsewhere from a different owner: AdicSpacesPartII requests ‘the r-th Fitting ideal F_r(M) of a finitely presented module M over an arbitrary commutative ring … independence of the presentation, compatibility with base …
- B2-9 (minor): Presentation independence uses the Cauchy–Binet formula for rectangular matrices, which the packet already plans as Matrix.compound_mul in reader C's node compound-matrix; higher-fitting-ideal therefore lists PadicMeasuresIwasawaAlgebras:L6/compound-matrix as …
- K2-9 (gap): The definition node carries, in nine proof steps, four results of lemma size besides the definition: the effect of a redundant generator on the ideals of minors (step 3), independence of the presentation (steps 1 and 4), base change with localisation (step …

### `relation-minors-add-generator` — added
Declaration `TauCeti.Module.relationMinorsIdeal_snoc` (lemma). Lemma for higher-fitting-ideal: the ideals of minors when a redundant generator is added.

### `higher-fitting-independence` — added
Declaration `TauCeti.Module.higherFittingIdeal_eq_relationMinorsIdeal` (theorem). Lemma for higher-fitting-ideal: independence of the presentation.

### `higher-fitting-base-change` — added
Declaration `TauCeti.Module.higherFittingIdeal_baseChange` (lemma). Lemma for higher-fitting-ideal: base change and localisation, used by transpose-higher-fitting.

### `locally-quadratic-presentation` — corrected
Declaration `TauCeti.IsLocallyQuadraticPresentation` (definition). Fields changed: api, hypotheses, prerequisites, proofSteps, sources, statement, tests, uses.

- B-5 (error): The statement says a locally quadratic presentation is quadratic ‘factorwise over a finite product of local rings (such as Z_p[G] and its algebras)’, and uses[1] says ‘over Z_p[G]-algebras the locally quadratic presentation is quadratic’.
- B-6 (gap): Proof steps 1–2 use the named facts ‘a finitely generated projective module over a local ring is free’ and ‘a projective module of constant rank over a finite product of local rings is free’, but the prerequisites list only Module.Projective, Module.Free and …
- B-11 (minor): No test separates ‘locally quadratic’ from ‘quadratic’: the three tests are passed by the wrong definition that requires P_0 and P_1 free, and none shows that the locality hypothesis in isQuadraticallyPresented is needed.
- D-8 (gap): Steps 1 and 2 use 'a finitely generated projective module over a local ring is free' and its rank statement as known facts.
- B2-6 (minor): The node still carries, besides the definition, the assertions ‘quadratic ⇒ locally quadratic’ and ‘locally quadratic ⇒ quadratically presented over a ring with finitely many maximal ideals’.
- K2-1 (gap): Step 2 obtains the hypothesis of Module.nonempty_basis_of_flat_of_finrank_eq from Module.rankAtStalk_eq, which it describes as ‘the dimension of P/𝔪P over R/𝔪’.
- K2-6 (minor): ‘Over a ring with finitely many maximal ideals — a local ring, or a finite product of local rings such as …’ reads as if rings with finitely many maximal ideals were the local rings and the finite products of local rings.
- K2-12 (minor): The statement departs from the letter of Remark A.7 in two ways that the match does not record.

### `extension-relation-matrix` — added
Declaration `TauCeti.range_toLin'_fromBlocks_eq_ker_of_exact` (lemma). Split from fitting-extension: generators and block relation matrix of an extension.

### `quadratic-presentation-extension` — added
Declaration `TauCeti.isQuadraticallyPresented_of_exact` (theorem). Split from fitting-extension: Lemma 2.6, second assertion, with the corrected sign of the off-diagonal block.

- K2-8 (gap): The node is two declarations. Its statement proves (i) for an arbitrary finite relation matrix Ψ of A (size n×p), the generators and the block relation matrix [[Ψ, −X], [0, φ_C]] of B, and (ii) ‘in particular’ Lemma 2.6, second assertion (A and C …

### `fitting-extension` — corrected
Declaration `TauCeti.fittingIdeal_eq_mul_of_exact` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- B-1 (error): The statement gives the relation matrix of B as [[ψ_A, X], [0, φ_C]] with X defined by the lifted relations (Σ_j φ_{jk}c̃_j = Σ_i X_{ik}a_i, proof step 1), but proof step 2 derives the relation columns (−X_k, φ_k).
- B-12 (minor): ‘A finitely generated … is equivalent to B finitely generated’ is correct, and ‘A finitely generated’ is the right extra hypothesis (nothing more is needed: the minors argument works with infinitely many relations of A).
- D-16 (minor): Step 3 evaluates the surviving (n + m)-minors of the block upper-triangular relation matrix as '(n-minor of A's relations)·det φ_C'.
- B2-11 (minor): The node's former excerpt (‘Furthermore, if A and C are both quadratically presented, then B is as well’) is the second assertion of Lemma 2.6 and moves with it to quadratic-presentation-extension.
- K2-7 (minor): (a) mathlib:Module.finitePresentation_of_ker is a prerequisite and is named in a hypothesis, but no proof step uses it: step 1 gets ‘B is finitely presented’ from the block matrix instead (which would need Module.Presentation.finitePresentation or …
- K2-11 (minor): The two acceptance items do not test the hypothesis on C: the first is one instance with C = R/(b), and in the second (split sequences) Fitt(A ⊕ C) = Fitt(A)·Fitt(C) holds for every finitely presented C, quadratically presented or not (the maximal minors of a …

### `fitting-fibre-product` — corrected
Declaration `TauCeti.fittingIdeal_mul_comm_of_exact` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- J2-10 (minor): The statement is about quadratically presented modules, and step 3 uses that B and B′ are quadratically presented, but the definition node PadicMeasuresIwasawaAlgebras:L6/quadratic-presentation is not a prerequisite (the sibling nodes fitting-extension, …
- J2-11 (minor): Both acceptance items are degenerate (C = 0; B = B′ with A = A′) and neither exercises the fibre product.

### `pid-cokernel-cardinality` — added
Declaration `TauCeti.natCard_quotient_range_toLin'_of_det_ne_zero` (lemma). Split from quadratic-cardinality: #(D^m/AD^m) = #(D/det A) over a principal ideal domain.

- B2-2 (minor): Reader D and I named different Mathlib lemmas for ‘det A is associated to ∏ x_i’: I had LinearMap.associated_det_of_eq_comp (Determinant.lean:575), D has LinearMap.associated_det_comp_equiv (line 584).
- J2-1 (gap): Step 3 needs a basis b′ of D^m and a basis (x_i·b′_i) of N whose coefficients x_i are the SAME elements as in the isomorphism of step 2.
- J2-2 (gap): Two library facts are named or used without being prerequisites: (i) step 2 uses adj(A)·A = det(A)·I, which is the separate declaration Matrix.adjugate_mul; the node calls it 'the companion identity adjugate_mul of Matrix.mul_adjugate' and lists only …
- J2-3 (minor): The case D = ℤ of this lemma is already in Mathlib (Submodule.natAbs_det_equiv; AddSubgroup.index_eq_natAbs_det); the node does not say so.

### `finite-index-cokernel-descent` — added
Declaration `TauCeti.natCard_quotient_range_toLin'_subring` (lemma). Split from quadratic-cardinality: the descent of the source’s (27)–(28), with the hypothesis that det A is a non-zerodivisor of the larger ring made explicit (source finding E18).

- J2-4 (gap): The only matrix identity the proof uses is adj(A)·A = det(A)·I, the declaration Matrix.adjugate_mul, which is named in step 1 but is neither a prerequisite nor a baseline reference; the listed prerequisite Matrix.mul_adjugate (A·adj(A) = det(A)·I) is used by …
- J2-6 (minor): The sentence 'For m = 1: #(B′/dB′) = #(B/dB)' is about the quotients by the principal ideals dB′ and dB, while the declaration of the node is about (Fin m → B)/range(A).

### `cokernel-modulo-finite-ideal` — added
Declaration `TauCeti.natCard_quotient_range_toLin'_quotient_of_finite` (lemma). Split from quadratic-cardinality: the reduction modulo a finite ideal that completes the source’s proof of Lemma 2.4.

- LC-6 (gap): Part (a) of the packet statement is that the projection B^m → (B/K)^m induces a bijection of the cokernels; the Lean statement keeps only the equality of `Nat.card` (which does give 'finite together', the cokernels being nonempty) and mentions the bijection …

### `finite-index-subring-nonzerodivisor` — added
Declaration `TauCeti.mem_nonZeroDivisors_tfae_of_finiteIndex_pi` (lemma). Split from quadratic-cardinality: a non-zerodivisor of a finite-index subring of a product of infinite domains is one of the product.

### `quadratic-cardinality` — corrected
Declaration `TauCeti.QuadraticPresentation.card_eq` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- B-2 (gap): The node repairs the source's proof without recording the defect.
- B-3 (minor): ‘characteristic zero … is what makes x a non-zerodivisor of B′’ is imprecise.
- B-4 (minor): The proof is correct but leaves three things unsaid. (i) The PID case is applied to B′, which needs B′/(det A)B′ finite; the hypothesis only gives B/(x) finite, and the proof never states the (easy) transfer; it follows from the first half of step 4, which …
- D-7 (gap): Step 3 attributes to 'Smith normal form' (prerequisite mathlib:Submodule.smithNormalForm) the isomorphism D^m/AD^m ≅ ⊕ D/x_iD, the relation ∏ x_i = det A up to a unit and the count #(D^m/AD^m) = #(D/det A).
- B2-5 (minor): The complete proof of Lemma 2.4 has three independent arguments, each a separate declaration: the count over a PID (which the source calls well known and Mathlib has only for Z), the descent (27)–(28) to a finite-index subring, and the reduction modulo K.
- B2-10 (minor): Two prerequisites of the original node are removed: PadicMeasuresIwasawaAlgebras:L6/character-group-ring-nonzerodivisor, which no proof step used (the statement mentions R_Ψ only as an instance), and mathlib:Submodule.smithNormalForm, which now belongs to …
- J2-7 (gap): Step 2 uses adj(A)·A = d·I, the declaration Matrix.adjugate_mul, named in the text but neither a prerequisite nor a baseline reference; the listed prerequisite Matrix.mul_adjugate is used by no step.
- J2-8 (gap): No acceptance item tests the theorem: in items 1, 3 and 4 the module is N = B/(x) with the 1×1 presentation (x), for which #N = #(B/(x)) is a tautology, and item 2 is N = 0.
- J2-9 (minor): 'that step fails when a factor is a finite field' is too strong: with a finite-field factor the step can fail (it fails exactly when det(A) has a zero component at such a factor), it need not.
- J2-19 (minor): After the split into pid-cokernel-cardinality and finite-index-cokernel-descent the proof still contains two arguments that are not routine and have statements of their own: step 2 (for a finite ideal K and d = det A a non-zerodivisor: AK^m = K^m, B^m/AB^m ≅ …

### `compound-matrix` — corrected
Declaration `Matrix.compound` (construction). Fields changed: acceptance, api, hypotheses, prerequisites, proofSteps, tests, uses.

- C-1 (gap): Proof step 2 names two library facts (exteriorPower.map_apply_ιMulti and the dual basis ιMultiDual) and step 3 silently uses three more (the matrix of a composite, toLin' of a product, det of a transpose); none of them is a prerequisite or a baseline …
- C-2 (gap): The pinned Tau Ceti library already has the r = 2 case of this node, and the node neither cites it nor states compatibility: Matrix.pairMinor (the 2×2 minor on an ordered row pair and an ordered column pair) and Matrix.pairMinor_mul (Cauchy–Binet for 2×2 …
- C-3 (minor): The test does not say which size the identity matrix has, and '(4)' is right for one size only.
- C-5 (minor): 'enumerated increasingly by Set.powersetCard.ofFinEmbEquiv': the equivalence goes from order embeddings to subsets; the increasing enumeration of a subset is its inverse.
- D-12 (gap): Step 2 names exteriorPower.map_apply_ιMulti and 'the dual basis ιMultiDual of Module.Basis.exteriorPower'.
- E-6 (gap): The pinned Tau Ceti already has 2×2 minors on ordered pairs of rows and columns and Cauchy–Binet for them; `Matrix.compound_mul` at r = 2 restates `Matrix.pairMinor_mul`, and the node neither cites these nor plans the comparison (PROTOCOL §12 compatibility …
- F-14 (minor): One other packet plans a statement about the same object: the determinant of the exterior power of a matrix (Sylvester–Franke), whose proof uses the fact that the matrix of ⋀ʲg consists of j×j minors — the L6 construction.
- C-29 (minor): Adopted after checking: the node KTheoryLowDegrees:Z.3/compound-matrix-determinant exists in research/blueprint/packets/KTheoryLowDegrees--Z.3.json and says what F reports (det(⋀ʲg) = det(g)^{C(n−1, j−1)}; its first proof step uses that the matrix of ⋀ʲg in …
- C-30 (minor): D-12 and D-13 agree with C-1, C-2, C-6, C-7. Residual items folded in: prerequisites mathlib:exteriorPower.ιMultiDual and mathlib:Set.powersetCard.ofSingleton (D's baseline entries), and the hypotheses of Set.powersetCard.compl in step 1 of higher-adjugate.
- M2-1 (minor): Three imprecisions. (i) The notation A·e is used in step 4 and in the API item compound_submatrix_col without being defined in this node (it is explained only in the statement of compound-image-determinant).

### `complement-shuffle-sign` — added
Declaration `Set.powersetCard.sign_permOfDisjoint_compl` (lemma). Split from higher-adjugate: the sign of the shuffle of a subset with its complement.

### `generalised-laplace-expansion` — added
Declaration `Matrix.sum_compound_mul_compound_compl` (lemma). Split from higher-adjugate: the Laplace expansion along a set of rows, which is in neither pinned library.

### `higher-adjugate` — corrected
Declaration `Matrix.higherAdjugate` (construction). Fields changed: api, prerequisites, proofSteps, tests, uses.

- C-6 (gap): Both identities rest on the generalised Laplace expansion along a SET of rows (or columns), det A = Σ_T (−1)^{ΣS+ΣT} det A[S, T] det A[Sᶜ, Tᶜ], which the steps quote as known ('Laplace expansion along the rows S gives det A').
- C-7 (gap): Step 4 uses the cofactor form of Mathlib's adjugate ('whose (j, i) entry is (−1)^{i+j} det A with row i and column j deleted').
- D-13 (gap): (a) Step 1 names Set.powersetCard.compl, which exists but is neither in baseline.declarations nor a prerequisite; its hypotheses ([DecidableEq α] [Fintype α] and a proof m + n = Fintype.card α) are not recorded.
- M2-2 (gap): Four library facts that the proof uses are not prerequisites.
- M2-3 (minor): (i) Two facts that the packet itself uses are missing from the API: adj_r(Aᵀ) = adj_r(A)ᵀ (step 6 of this node's proof) and adj_0(A) = (det A) (the acceptance item ‘r = 0’ of compound-image-determinant; the statement allows 0 ≤ r ≤ m).
- M2-4 (gap): The node bundles three declarations with non-routine proofs. Besides the definition of adj_r it proves (a) the sign of the shuffle of a subset with its complement (API item Set.powersetCard.sign_permOfDisjoint_compl, a statement about permutations in another …

### `compound-image-determinant` — added
Declaration `Matrix.det_smul_mem_range_compound` (lemma). Split from exterior-cokernel-annihilator: the free core of Lemma 3.9 with the corrected last step (source finding E17).

- C-22 (minor): Changed judgement on C-11, following the lead's decision G3: the free core of Lemma 3.9 is no longer proposed as an API item of higher-adjugate; it is the new lemma node PadicMeasuresIwasawaAlgebras:L6/compound-image-determinant, placed after higher-adjugate, …

### `exterior-cokernel-annihilator` — corrected
Declaration `TauCeti.fittingIdeal_le_annihilator_exteriorPower_cokernel` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- C-8 (gap): Steps 1–2 use three library facts that are not listed: (i) M/N is finitely presented and the kernel of the CHOSEN surjection R^m ↠ M ↠ M/N is finitely generated — the step says 'choose R^m ↠ M and a finite presentation R^n → R^m → M/N', which needs that this …
- C-9 (minor): '(n ≥ m after adding zero columns, which changes no minor)': adding zero columns does add m×m minors (all zero); what is unchanged is the ideal they generate.
- C-10 (minor): 'For every r ≥ 1' follows the source ('each positive integer r') but the restriction is not needed: for r = 0 the map ⋀^0 N → ⋀^0 M is the identity of R, the cokernel is 0, and the free-case identity holds too (C_0(A) = (1), adj_0(A′) = (det A′)).
- C-11 (minor): The Lean block has a declaration that no packet field names: the free core of Lemma 3.9.
- C-27 (minor): C-10 is settled as decided: 'r ≥ 1' stays and the acceptance item for r = 0 is added.
- M2-5 (gap): Step 4 applies compound-image-determinant to ‘every x ∈ ⋀^r R^m’, but that lemma is stated for r ≤ m (the higher adjugate adj_r of an m×m matrix exists only for r ≤ m), while the theorem is for every r ≥ 1 and m is the number of generators chosen for M in …
- M2-6 (minor): The three acceptance items are the boundary cases r = 1, N = M and r = 0; none is a concrete instance in which the ideal and the cokernel are computed, and none shows the statement for r ≥ 2, the case that needs compound matrices.

### `presentation-transpose` — corrected
Declaration `TauCeti.PresentationTranspose` (construction). Fields changed: api, hypotheses, prerequisites, proofSteps, tests, uses.

- C-13 (gap): The API does not let a user work with the transpose without unfolding it (PROTOCOL §4).
- C-14 (minor): 'The carrier is definitionally TauCeti.AuslanderReitenTranspose f' is not a unit test in the sense of PROTOCOL §12: 'definitionally' is a notion of the proof assistant, not a mathematical statement (packets contain no Lean, §0), a compatibility test is …
- D-11 (gap): The four cited Tau Ceti declarations exist with the cited statements and carry no projectivity or finiteness hypothesis, so the reuse is legitimate.
- E-9 (gap): The packet says the transpose reuses the pinned cokernel together with its quotient map and `mk_eq_zero_iff` (“reuses AuslanderReitenTranspose.mk_eq_zero_iff”) and `linearEquiv`, but in the Lean `mk := sorry`, `mk_eq_zero_iff := sorry` and `equivOfIso := …
- C-24 (gap): Merged. I re-read the pinned file for D-11: line 6 `module`, line 74 `public section` without @[expose], and the comment at lines 311–316 say the definition is not exposed; D is right, and step 1 now says that every construction goes through mk, …
- M2-7 (gap): Library facts used by two steps are not prerequisites. (i) Step 1 identifies the pinned R-module structure of AuslanderReitenTranspose f with its R^op-structure ‘read through r ↦ op r’ (and the API item toARTranspose_smul states both forms); this is the …
- M2-8 (minor): (i) Hypothesis 2 speaks of ‘the uniqueness theorem for minimal presentations over semiprimary rings’.

### `transpose-stable-equivalence` — corrected
Declaration `TauCeti.PresentationTranspose.stableEquiv` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, sources, statement.

- C-15 (minor): Ownership boundary with the Tau Ceti roadmap QuiverRepresentations, Layer 6, is recorded only in a hypothesis of presentation-transpose; the theorem that actually touches it carries no word about it.
- C-16 (gap): The proof is correct, but it uses library facts that are not listed, and two places need to be said precisely.
- C-17 (minor): Acceptance item 1 ('0 ⊕ S ≅ S ⊕ 0') is true but is not the instance of the displayed isomorphism, so it does not test on which side each summand stands; item 2 ('consistent with uniqueness up to free summands') tests nothing.
- D-17 (gap): Two named library facts are used without citation: the lifting property of projective modules (steps 1 and 2: 'Choose β … (projectivity)', 'choose s … with us = v') and 'duals of finitely generated projectives are finitely generated projective' (step 3).
- M2-9 (minor): (i) The ‘in particular’ clause uses M′, M″, P, Q, which the node does not define (they are the source's letters).

### `transpose-fitting` — corrected
Declaration `TauCeti.PresentationTranspose.fittingIdeal_eq` (theorem). Fields changed: acceptance, hypotheses, prerequisites, proofSteps, statement.

- C-18 (minor): Two small omissions. (i) The packet's request to StableReduction Layer 1 lists this node in `neededBy`, and hypotheses[1] imports the Fitting ideals from that stage, but the stage is not among the node's prerequisites (PROTOCOL §3: the supplier stage is …
- C-26 (minor): Checked for bundling: Lemma 6.1 has two assertions (M^tr is quadratically presented with matrix (a_ji^#); the Fitting identity).

### `transpose-higher-fitting-free` — added
Declaration `TauCeti.PresentationTranspose.fittingIdeal_eq_excess` (lemma). Split from transpose-higher-fitting: the matrix case of (171).

- C-23 (gap): Changed judgement on C-20. With (171) restated for projective presentations (C-19), the free matrix case is a separately declared assertion and a non-routine step of the proof, so by G3 it is its own lemma node, …
- M2-11 (minor): The three Fitting statements are made for an arbitrary commutative ring R with a ring isomorphism σ : R^# → R, but they use a_ji^# and Fitt^s_R(M)^# (resp.

### `transpose-higher-fitting` — corrected
Declaration `TauCeti.PresentationTranspose.fittingIdeal_eq_excess_of_projective` (theorem). Fields changed: acceptance, hypotheses, library, prerequisites, proofSteps, sources, statement.

- C-19 (error): The node is announced as 'Dasgupta–Kakde (171)' but is stated for a FREE presentation R^t → R^{t+s}, and its hypothesis 3 reduces projective presentations to free ones only 'over a finite product of local rings'.
- C-21 (minor): Hypothesis 3 cites the node locally-quadratic-presentation, which is not among the prerequisites, for a reduction that the source's ring Z[G] does not allow (see C-19).
- M2-10 (gap): The localisation argument is correct, but three of its ingredients are used without a prerequisite.

### Findings about the packet as a whole, the Lean block, the fix report or other files

- A-3 (gap; packet): The coefficient hypothesis 'O contains the e-th roots of unity, e the exponent of G' has a pinned Mathlib name, HasEnoughRootsOfUnity O (Monoid.exponent G), with exactly the consequences the L6 nodes use.
- A-11 (error; lean:TauCeti.charGroupRing.isUnit_iff_exists): False as typed: the hypothesis Ψ.Nonempty, which the packet statement has ('If Ψ is nonempty and contained in Ψ_χ'), is missing.
- A-14 (minor; packet): View asked for: the node is correctly sourced to §7.2.9 in substance, but the source entry does not say which Ψ the sentence is about, and read on its own ('The ring R = R_Ψ is a complete local Z_p-algebra') it suggests a claim about arbitrary character group …
- A-21 (gap; packet): PadicMeasuresIwasawaAlgebras is planned at lemma level, where one node is one library declaration and a result with several parts becomes one node per part unless the source proves the parts simultaneously.
- A-22 (gap; lean:TauCeti.charGroupRing.componentEquiv): Several Lean declarations do not say what the packet says. (1) `charGroupRing.componentEquiv` is a data-valued declaration with a placeholder body and no characterising lemma, so it asserts only that some O-algebra isomorphism R_{Ψ_χ} ≃ O[G_p] exists; the …
- B-8 (minor; lean:TauCeti.QuadraticPresentation.cokernel): The packet items say WHICH presentation is produced (‘coker(φ) is quadratically presented by φ’, ‘N × N′ … by the block-diagonal matrix’, ‘the zero module, presented by R →(1) R’), but the Lean declarations cokernel, prod, zero, ofLinearEquiv are bare data …
- B-13 (minor; packet): The shared hypothesis says the Fitting ideal ‘of a finitely generated R-module’ is ‘imported from the Tau Ceti roadmap StableReduction, Layer 1 (accepted RS-16)’.
- B-14 (minor; lean:TauCeti.isQuadraticallyPresented_of_exact): The packet's statement of the second part of Lemma 2.6 gives the size n + m and the block-triangular matrix; the Lean theorem only asserts IsQuadraticallyPresented R B.
- C-4 (minor; lean:compound_not_additive (example) and …): Both Lean examples are existential (∃ A B, (A + B).compound 2 ≠ …; ∃ A, A.higherAdjugate 1 _ ≠ A.compound 1) while the packet tests name the instance (A = B = 1 of size 2; A = diag(2, 1, 1)).
- C-12 (minor; packet): E17 is right and correctly classified (kind gap, affects the proof); I would confirm it.
- C-20 (gap; lean:TauCeti.PresentationTranspose.fittingIdeal_eq_excess): The Lean statement is the free case only (A : Matrix (Fin (t + s)) (Fin t) R); it is true as typed, but it is not (171) (finding C-19).
- D-1 (minor; baseline:mathlib:Submodule.smithNormalForm): The `provides` text ('a basis of M and of N in Smith normal form') does not say what the declaration returns, and two nodes read more into it than it gives (D-6, D-7).
- D-18 (error; packet): The new request to tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs, and the hypothesis sentence repeated in fitting-quadratic, fitting-extension, fitting-fibre-product, quadratic-cardinality, exterior-cokernel-annihilator, …
- D-19 (minor; baseline:mathlib:Module.Dual): Four baseline entries that the new L6 nodes cite as prerequisites (mathlib:Module.Dual in contragredient-dual; mathlib:Module.Projective and mathlib:Module.Free in locally-quadratic-presentation and transpose-stable-equivalence; mathlib:Module.annihilator in …
- D-23 (minor; baseline:mathlib:Module.rankAtStalk_baseChange): Audit of the 64 baseline declarations that readers A, B and C added (state origin/main + r1_A + r1_B + r1_C, which is the working-tree packet): all 64 exist under the exact name with the stated kind, module and line.
- E-7 (gap; lean:TauCeti.charGroupRing.equivGroupRing): `equivGroupRing … : MonoidAlgebra O G ≃ₐ[O] charGroupRing Set.univ := sorry` is an unconstrained equivalence: nothing in the file says it is α_Ĝ, although the packet's lattice node (iii) and the acceptance of character-group-ring say “α_Ĝ : O[G] → R_Ĝ is an …
- E-8 (gap; lean:TauCeti.ContragredientDual.map): `ContragredientDual.map f := sorry` with only `map_id` and `map_comp` stated: the two functor laws do not say that the map is φ ↦ φ ∘ f (the packet statement and proof step 2 say it is `LinearMap.dualMap f`), so the planned object is not pinned down and the …
- E-10 (gap; lean:TauCeti.QuadraticPresentation.cokernel): `cokernel hm φ := sorry` does not say that the presentation of coker(φ) has matrix φ (the packet: “coker(φ) is quadratically presented by φ”), and `ofLinearEquiv := sorry` does not say that the matrix is unchanged; so `fittingIdeal_eq` applied to them yields …
- E-12 (minor; lean:test compound_not_additive): Both examples state an existential (`∃ A B, (A + B).compound 2 ≠ …`, `∃ A, A.higherAdjugate 1 _ ≠ A.compound 1`), which is weaker than the packet's tests: those name the matrices (1 + 1 for 2×2 over ℤ; A = diag(2, 1, 1) with adj_1(A) = diag(1, 2, 2)).
- E-13 (minor; lean:test transpose_depends_on_presentation): The example states only `Nonempty (PresentationTranspose σ (LinearMap.fst R R R) ≃ₗ[S] S)`; the packet's test is “has transpose ≅ S, not 0”.
- E-14 (minor; lean:test charGroupRing_not_gorenstein): The example quantifies over an instance, `∀ [IsLocalRing (charGroupRing Ψ ⧸ I)], …`, so that it can write `IsLocalRing.maximalIdeal`: locality of R_Ψ/(ζ − 1) is assumed, not asserted, whereas it is part of what the test claims (a local ring whose maximal …
- E-15 (minor; lean:TauCeti.fittingIdeal_le_annihilator_exteriorPower_cokernel): The instance hypothesis `[Module.Finite R (M ⧸ N)]` is redundant: it is found by instance search from `[Module.FinitePresentation R M]` (Mathlib instance FinitePresentation → Finite, priority 100, Mathlib/Algebra/Module/FinitePresentation.lean:71) and …
- F-1 (gap; packet:research/blueprint/packets/DirichletPadicLFunctions--L3.json): The fix leaves the accepted, live L3 packet unchanged and says findings /1 and /2 are 'planned in the accepted L3 packet and its follow-up part L3-2'.
- F-2 (minor; file:research/blueprint/redteam/RT-AREA-iwasawa-2.fixes-2.md): Three entries of the /1 table do not describe the nodes they name.
- F-3 (gap; file:research/blueprint/redteam/RT-AREA-iwasawa-2.fixes-2.md): Two sentences of the fix report contradict the accepted L3 packet.
- F-4 (gap; packet:research/blueprint/packets/DirichletPadicLFunctions--L3-2.json …): The fix report's statement that the L3-2 nodes match the contract is too strong in three places.
- F-5 (gap; packet:research/blueprint/packets/PadicHodgeRegulators--D.1.json …): The carrying packet still contains the ownership claim the verifier rejected, in the very node the fix report cites as 'preserving the interfaces without claiming ownership'.
- F-6 (minor; queue:research/blueprint/queue.json (BP-PadicHodgeRegulators--D.1)): The job named as carrier of /3 has finished and been reviewed; its packet was sent back, and the queue at this commit contains no job that will revise it.
- F-7 (gap; packet:research/blueprint/packets/LocallyAnalyticDistributions.json): The carrying record exists as quoted, but it carries the red team's fix, not the verifier's corrected contract: it tells the carrying job to keep solid-module functional analysis out of the layer and to use the nonalternating characteristic-series product, …
- F-10 (gap; packet:research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json): After the fix the L4 coverage text is partly false and one routed item is carried nowhere in L6.
- F-11 (minor; packet:research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json): The count is wrong: the fix added 33 baseline declarations, not 35.
- F-12 (minor; file:research/blueprint/papers/PAPER-DASGUPTA-KAKDE-23.result.json): The fix report's list of extraction locator corrections is incomplete.
- F-13 (minor; packet:research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json): The new request is consistent with the accepted RS-16, but three things about the shared Fitting carrier are inconsistent across the atlas and the request does not say so.
- F-15 (minor; packet:research/blueprint/packets/PadicMeasuresIwasawaAlgebras.json): PROTOCOL §3 (cross-roadmap needs) asks for a `requests` entry naming the consuming nodes and for the supplier stage id as a prerequisite of those nodes.
- A-24 (minor; packet): Judgement following decision G1 ('a node keeps its proposed names only for what is new').
- A-26 (gap; packet): Implementation of decision G3, with one point where I went further than the candidates' list.
- A-31 (minor; packet): Record of what was folded in, and of the absence of disagreement on the pinned sources.
- B2-1 (minor; packet): Changed judgement. B-13 is closed by decision G2: fitting-quadratic, fitting-extension, fitting-fibre-product, quadratic-cardinality and the new higher-fitting-ideal carry the exact shared hypothesis sentence; fitting-extension has A finitely presented and …
- B2-12 (minor; lean:TauCeti.QuadraticPresentation.cokernel): Changed judgement. Reader E's fixed block already contains toPresentation, prod_size, prod_det, zero_size, zero_rel, cyclic_size, ContragredientDual.map_apply and equivPi_apply, and defines cokernel and ofLinearEquiv by structure literals, so their size, …
- B2-13 (minor; packet): The three drafted entries keep their substance and receive the ids E18 (Lemma 2.4, proof), E19 (§6.1, dual of an R_Ψ-module) and E20 (§2.3, M/N).
- B2-14 (minor; packet): Not settled by this reader: (i) Northcott, Finite free resolutions, Theorem 22, cited by the source for Lemma 2.6, was not available; the two nodes carry their own proofs.
- C-25 (minor; packet): New. The original node text cited the source-issue id E17 inside a `uses` entry and inside a proof step.
- G-10 (minor; packet): The statements of joint-evaluation-injective and of character-group-ring (and the hypothesis sentence shared by fifteen L6 nodes) are written with Monoid.exponent, which is neither a prerequisite of any node nor a baseline declaration.
- G-11 (minor; packet): The baseline entry for Units.coeHom says ‘The multiplicative map Rˣ →* R, used in the integer test case.’ No integer test case exists in the two nodes that cite it (character-evaluation, norm-element-kernel), and the fact those nodes take from the file, …
- G-13 (minor; packet): 59 baseline entries carry the name of a reviewing agent in their ‘checked’ field (‘…, reader D)’, ‘… reader F)’).
- G-14 (minor; packet): The proof of Lemma 2.5 repeats, for x ∈ R_Ψ, the step that E18 records for Lemma 2.4: ‘multiplication by x is an isomorphism between the two quotients’ O_Ψ/R_Ψ and xO_Ψ/xR_Ψ needs x to be a non-zerodivisor of the product O_Ψ, while the hypothesis is that x is …
- H2-4 (minor; packet): The node (and character-group-ring-adic-complete) excludes Ψ = ∅, where the sentence of §7.2.9 'The ring R = RΨ is a complete local Zp-algebra' is false as printed: the source never assumes that some character belonging to χ is free of trivial zeroes (§7.1 …
- H2-15 (minor; packet): The shared hypothesis sentence names three library declarations: HasEnoughRootsOfUnity, Monoid.exponent and CommGroup.card_monoidHom_of_hasEnoughRootsOfUnity.
- K2-10 (minor; packet): E20 (the definition names the module M, the display names it N) is right in quotation, locator, kind (misprint), reach (nothing) and correction.
- J2-12 (error; packet): kind is 'gap', but by the entry's own reading and evidence it is an 'error' (PROTOCOL §18: an error is 'a false statement or a step that fails', a gap 'a step asserted without an adequate proof').
- J2-13 (minor; packet): Two statements about the text are not exact. (a) reason: 'The final sentence of the proof (‘whence v ∈ B^m since det(A) is a non-zerodivisor’)' — this is the last sentence of the paragraph of (28), not of the proof; the proof ends with 'Equations (27) and …
- J2-14 (minor; packet): The last sentence of the correction, 'The dual defined just before (80), M^* := Hom_{Z[G]}(M, Z[G]), is the intended object only for Z[G]-modules', does not separate the two cases: every R_Ψ-module is a Z[G]-module (through Z[G] → O[G] → R_Ψ), which is …
- J2-15 (minor; packet): 'M does not occur again' is true of the definition only; in the same subsection the letter M is used again, for the fibre product in the proof of Lemma 2.7 (TeX line 694, PDF p.
- J2-16 (minor; packet): The quotations and the statements about other records are accurate (checked one by one, see evidence), and `need` is the statement the nine consuming nodes use.
- J2-17 (minor; packet): The first sentence is not true of the packet as it stands. (1) 'which import the character-decomposition idempotents of this layer' holds for one of the four nodes named (component-character-group-ring); character-group-ring, character-group-ring-lattice and …
- J2-18 (gap; packet): 'Dasgupta–Kakde item 20: Ann_{Z[G]}(M^∨) = Ann_{Z[G]}(M)^# for finite M, through the contragredient-dual and sharp-involution nodes' names the wrong node.
- M2-12 (error; packet): The assertion that the image of C_r(A) is stable under adj_r(A′) is TRUE, but the justification given for it is not adequate as worded: ‘adj_r(A′) is a combination of operators induced on ⋀^r by powers of A′’.
