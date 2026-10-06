# Independent review: Hilbert toroidal compactifications and boundary geometry

Job `REV-ShimuraCompactifications--C6`, issue #488. Reviewer: **Codex — codex-r3upQC**. Date: 2026-10-06. The author’s final planning session was codex-7UxuNV; this reviewer did none of that work.

**Accepted after corrections.** This is one complete target-level planning pass, with C6 **planned**, not closed or formalized. Every target is represented by a justified node or an explicit owner interface; the remaining supplier implementations and version-of-record collation are recorded honestly. There is no unresolved mathematical contradiction in the corrected plan.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes checked | 52: 13 lemmas, 23 theorems, 15 comparisons, 1 construction |
| Per-node verdicts | 32 verified, 20 corrected, 0 added, 0 unverifiable |
| Mathematical/dependency corrections | 2 nodes; the other 18 corrections repair citation pagination/source scope |
| Baseline | 13 citations confirmed at the exact pins; 0 removed or replaced |
| Construction API and tests | 6 API items, 5 discriminating tests, all checked |
| Planets | 6 key results/constructions, all appropriate and named |
| Source issues | 3 checked and confirmed, with narrower accessible-version verdicts |
| Remaining obligations | 19 precise supplier requests and 4 gaps; no closure claim |
| Suggested Lean | 13 packet signatures, 6 API signatures, 5 construction tests and 7 arithmetic acceptance examples elaborate; 39 geometric signatures are honestly omitted |

Read the entire packet, suggested file, reader, author handoff and C6 roadmap; the RS32 binding and accepted review; C6’s library audit and accepted AUDIT10 result; the supplier statements for C0–C5, H1–H4, SF.0/SF.1, F0/R2/R3, R11.3, R07.2, T0 and R13.4a/b; and the confirmed red-team finding and its review. The upstream Analytic Toric Geometry and Adic Spaces documents were read completely. Modular Curves Layer 10 was checked at its exact prime-level diamond-quotient scope. No upstream or duplicate layer is replanned.

## Corrections made

1. **Integral cusp ideals (`hilbert-boundary-ideal-pushforward`).** The statement is over B=Z[1/N(n)], whereas its former direct prerequisite `hilbert-boundary-constant` assumes the discriminant-inverted weight base. Replaced that proof with the integral route: toric boundary monomial quotient bases give flatness and geometric reducedness; the contraction identifies geometrically connected boundary fibres; the requested proper-flat global-function theorem gives f_*O_D=O_C. Left exact pushforward of the ideal sequence gives π_*I_D=I_cusp, followed by projection formula. Added the actual chart/fibre/C0 prerequisites, strengthened C0/C5/SF.0 requests, and made the base distinction explicit in acceptance and the suggested omission ledger. Coefficient base change still requires the stated comparison theorem; no pointwise nilpotent test is substituted.
2. **Finite level maps (`hilbert-p-level-boundary-comparison`).** The former proof applied a finite compactification extension theorem without recording toroidal fan compatibility. Distinguished canonical minimal/finite-normalization maps from toroidal maps using the actual cusp lattice maps and compatible admissible fans. Finiteness uses the pullback fan or finite normalization; further subdivisions can be proper and nonfinite. Added C0/C3 direct prerequisites, a fan hypothesis and a counterexample criterion, strengthened their requests and the C5 extension request, and synchronized the suggested omission ledger. The mixed G-level problem and integral wild-level limitation remain explicit.
3. **Citation pagination.** Nodes 1–12 now use the printed pages of `DIMITROV-AUTHOR`, rather than combining that source ID with arXiv page numbers. Proposition 8.5(iii) is on printed p. 548. The toric coordinate passages are separately located at pp. 529–530. Removed an extra terminal period from the theorem marker in nine excerpts so that they match the author copy literally.
4. **Citation ownership.** Split mixed-document locators for nodes 22, 27, 43, 50 and 51 into records for the document actually cited. Node 52’s supplier locator is now R13.4a. The modular roadmap records explicitly identify supplier contracts rather than implemented results. Short added excerpts were checked literally in the named source.
5. **Review evidence and remaining lists.** Added all 52 independent verdicts and the three source-issue verdicts; recorded the reviewer’s exact source-reading scopes and matching hashes; refreshed public correction-search evidence. Removed the now-completed accessible-copy independent review from the remaining lists, retaining publisher collation. Recorded the two new explicit supplier obligations in the existing gaps. No nodes, baseline entries, API items, tests or planets were added or removed.

The reader document was checked, including the handed red-team finding, and left unchanged because this review’s deliverables do not authorize editing it. Its stated ideal comparison is retained by the corrected integral proof; its level-map discussion is read under the roadmap’s compatible-fan construction. The assembly should carry these two explicit proof/dependency refinements into the reader when it next synchronizes the corrected packet.

## Sources and version limitations

- [Dimitrov author copy](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad15-Di.pdf): entire 27-page copy, introduction, §§1–8 and bibliography; printed pp. 525–551. All node locators and excerpts checked. SHA256 matches the packet.
- [Dimitrov arXiv v3](https://arxiv.org/pdf/math/0212071v3): fetched and hash confirmed; proof-issue passages on pp. 23–24 collated against the author copy. The original author’s full preprint reading is retained as author evidence, not claimed as a fresh whole-preprint reading by this reviewer.
- [Dimitrov–Tilouine author copy](https://gitlabpages.univ-lille.fr/dimitrov/articles/Pad16-DiTi.pdf): the complete cited §7 passage, printed pp. 584–586, including the proof of Proposition 7.3; hash confirmed. The whole 58-page paper was not read for this review.
- [Birkbeck–Heuer–Williams](https://www.numdam.org/item/10.5802/aif.3560.pdf): all cited passages in §2.1, §§5.1–5.2, §7.1 and §§8.1–8.4; hash confirmed. This is not a claim of reading the entire 87-page PDF.
- [Modular Curves, Part II](../../../content/campaign/ModularCurvesPartII/README.md): whole supplier roadmap, especially R13.4a/b. This is a scope contract; the comparison implementation remains requested.

The publisher DOI pages failed to serve both Dimitrov texts again. Author-copy pagination differs from the publisher citation. Fresh public title/author plus errata/corrigendum searches, arXiv final-revision metadata and author publication listings found no correction; that is not proof no correction exists. Findings remain scoped to the accessible copies.

E-C6-1 is the omitted nonzero condition in the Koecher contradiction, not a failure of Koecher’s statement. E-C6-2 is only the zero-ring/zero-module wording imprecision; its intended additive-module argument is explained by the companion, and no replacement by C is asserted. E-C6-3 is the invalid commutation of the full formal-series target with filtered colimits: the series with ith coefficient e_i in ⊕_i Z is not defined over any finite-rank coefficient submodule. The packet uses the valid directed-union repair, requiring colimit commutation only for H0 and coefficientwise injectivity from the flat line. All three verdicts are recorded in `sourceIssues`.

## Baseline confirmation

Read the actual declaration statements from the pinned git objects: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each citation exists and supplies the needed statement with matching hypotheses and conventions. None was removed or fixed. In particular the finite-sum positivity declaration is generated by `to_additive` from the cited multiplicative source; it is not a nonexistent nearby theorem.

| Citation | Checked use |
| --- | --- |
| `mathlib:NumberField.Units.dirichletUnitTheorem.exists_unit` | For a selected infinite place, an integer unit has negative logarithm at every other place. Reuse this existing theorem; its unrestricted unit need not lie in the cusp subgroup. |
| `mathlib:NumberField.Units.sum_mult_mul_log` | The weighted sum of logarithms of an integer unit is zero. |
| `mathlib:NumberField.Units.pos_at_place` | The absolute value of an integer unit at each infinite place is strictly positive. |
| `mathlib:NumberField.IsTotallyReal.mult_eq` | Each infinite-place multiplicity is one in a totally real field. |
| `mathlib:Subgroup.exists_pow_mem_of_index_ne_zero` | A positive power of every group element belongs to a subgroup of nonzero index, with exponent at most its index. |
| `tauceti:NumberField.isTotallyPositive_iff` | The existing strict positivity predicate is positivity at every real infinite place. Zero is not totally positive in a totally real number field. |
| `tauceti:NumberField.isTotallyPositive_sq` | Every nonzero square is totally positive, including squares of integer units. |
| `mathlib:tendsto_pow_atTop_atTop_of_one_lt` | Powers of a real number greater than one tend to positive infinity. |
| `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one` | Powers of a nonnegative real number strictly below one tend to zero. |
| `mathlib:Units.mul_right_eq_zero` | Multiplication by a unit on the left preserves whether an element is zero; no domain or nontriviality hypothesis. |
| `mathlib:Finset.one_lt_prod_iff_of_one_le` | The indexed multiplicative statement generates Finset.sum_pos_iff_of_nonneg by to_additive. Its generated additive signature was checked by pinned Lean: a finite sum of nonnegative terms is positive exactly when one term is positive. Both source statements were read; the shared text index lists the generating declaration. |
| `mathlib:Submodule.traceDual` | Existing integral trace dual of a Z-submodule of a number field, using the rational trace form. |
| `mathlib:Submodule.mem_traceDual` | Membership means every trace pairing with the original module lies in the range of Z→Q. |

## API, ownership, tests and validation

The one new construction is a native trace phase character; the generic fan, formal scheme, moduli, semiabelian family, automorphic line and Hasse objects remain imported from their unique owners. Its AddMonoidHom carrier provides extensionality and structure. Its six explicit API items cover evaluation, zero/addition, lift independence, the trivial root and coefficient functoriality. The five tests detect a missed denominator, wrong trace dual, failure at zero, and a wrongly imposed primitive-root condition. The seven extra arithmetic examples distinguish strict positivity, exponent zero, degree one and a zero-divisor constant-term multiplier. These are planned assertions with `sorry`, not executed proofs.

Confirmed RT-AREA-padic-1/26 in both packet and reader: R07.2 owns generic BT₁ Ha=det(V*), LF and its Hodge–Tate sequence; T0 extends this interface to semiabelian degeneration; H2 specializes it to the actual Hilbert model. No generic Hasse ownership was moved into C6 or T0. The construction tests and the six planets agree with the packet and RS32 scope. H5/O6 and R13.4b consumers are not rebuilt.

`python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraCompactifications--C6.json` passes with zero errors and zero warnings. `lean-check research/blueprint/suggested/ShimuraCompactifications--C6.lean` exited 0 with exactly 31 warnings, all declaration uses of `sorry`. The shared checker uses the exact Mathlib pin. The suggested file imports only native Mathlib; the Tau Ceti strict-positivity equivalence was checked in pinned source and is written using signed real embeddings because its compiled object is unavailable in the shared build. No geometric statement was replaced by an arbitrary proposition or an axiomatized record. The only subsequent suggested-file changes are comments synchronizing the two omissions; executable Lean is unchanged.

## Orchestrator follow-up

No blocking question. Accept this pass as planned. Close the existing supplier interfaces before geometric implementation/closure, synchronize the two explicit refinements into the reader at assembly, and collate the three scoped source issues with the publisher versions when available. These are existing precise follow-ups, not reasons to repeat this review or claim the stage closed.

## Exhaustive node verdicts

IDs below have prefix `ShimuraCompactifications:C6/`; the packet contains each full ID.

| # | Node | Verdict | Independent check |
| --- | --- | --- | --- |
| 1 | `finite-index-cusp-unit-contraction` | corrected | Confirmed the finite-index power argument, weighted logarithm sum and real multiplicity convention at the pins; degree greater than one is essential. Corrected the mixed author/preprint pagination. Removed the extra terminal period from the literal theorem marker. |
| 2 | `negative-cusp-exponent` | corrected | Nonzero is explicitly required before a nonpositive real embedding can be made negative; zero is a separate allowed coefficient. Confirmed E-C6-1 and corrected pagination. Removed the extra terminal period from the literal theorem marker. |
| 3 | `negative-trace-orbit` | corrected | At the chosen negative embedding unit powers dominate while all other absolute values contract; positive dual y and degree greater than one are explicit. Corrected pagination. Removed the extra terminal period from the literal theorem marker. |
| 4 | `coefficient-unit-orbit` | corrected | Fourier covariance multiplies by units, hence preserves nonzero coefficients over rings with nilpotents and zero divisors. Corrected equation (5) pagination. |
| 5 | `bounded-cusp-support` | corrected | A preserved nonzero coefficient with unbounded negative trace contradicts the one uniform lower support bound. No analytic convergence or domain hypothesis is used. Corrected pagination. Removed the extra terminal period from the literal theorem marker. |
| 6 | `positive-exponents-on-charts` | corrected | Positive signed embeddings paired with a nonzero nonnegative boundary ray give positive integral monomial exponents in the actual lattice; C0 owns coordinates. Corrected the separate toric and Koecher locators. Removed the extra terminal period from the literal theorem marker. |
| 7 | `constant-term-covariance` | corrected | Specializing the covariance law at zero removes the root phase and gives (c(u,0)-1)a(0)=0. Corrected Proposition 8.5(iii) to printed p. 548. |
| 8 | `constant-term-vanishing` | corrected | The non-zero-divisor hypothesis is necessary over arbitrary coefficients; character nontriviality in characteristic zero alone is insufficient. Corrected Proposition 8.5(iii) pagination. |
| 9 | `meromorphic-cusp-support-bound` | corrected | A finite pole order on each Noetherian regular completed chart gives the lower trace bound; completed support and completion detection are explicitly requested. Corrected the toric/proof locators. Removed the extra terminal period from the literal theorem marker. |
| 10 | `hilbert-cusp-positive-support` | corrected | Actual cusp lattice, weight line, phase covariance and finite-index cusp units feed the support theorem; zero is retained. Corrected the author-copy locator. Removed the extra terminal period from the literal theorem marker. |
| 11 | `arithmetic-koecher` | corrected | The geometric regularity step and arbitrary-coefficient passage use the stated F0/SF.0/SF.1 interfaces, not arbitrary completion/tensor interchange; g>1 and the weight base are explicit. Corrected pagination. Removed the extra terminal period from the literal theorem marker. |
| 12 | `hilbert-boundary-constant` | corrected | On regular Hilbert charts every positive monomial is divisible by the boundary-union product, while the constant survives; formal detection retains nilpotents. C0 stratum intersection and boundary union are distinguished by the request. Corrected locators. Removed the extra terminal period from the literal theorem marker. |
| 13 | `cusp-lattice-comparison` | verified | Checked Definition 3.2 and Proposition 3.3(iv): X=cbb′=ab′, dual involves the different, and the congruences/effective u²ε action are retained; finite cyclotomic image is not the full stabilizer. |
| 14 | `admissible-fan-specialization` | verified | Definition 7.1 requires support the open positive cone and finite orbit set under the actual cusp-unit action. This is a Hilbert identification of the generic C0/C3 fan interface. |
| 15 | `trace-exponent-integral` | verified | Integral rational trace follows from nB⊆A and x∈traceDual(A); native Z-submodules avoid selecting an ideal generator. Suggested signature matches. |
| 16 | `trace-exponents-congruent` | verified | Changing x by traceDual(B) changes nTr(ξx) by an integer multiple of n; integer witnesses are unique through Z→Q injectivity. |
| 17 | `phase-independent-of-lift` | verified | ζ^n=1 and congruent integer exponents suffice, with no primitive-root requirement. Negative exponents are valid in the unit group; the wrong-dual test is discriminating. |
| 18 | `phase-additive-in-character` | verified | Trace additivity gives multiplicativity of the phase and value one at zero for integral witnesses. No geometric cusp carrier is fabricated. |
| 19 | `uniformization-phase-character` | verified | Native AddMonoidHom to Additive(R×) supplies extensionality and homomorphism structure; all six API signatures and five tests agree with the packet, including denominator, dual-shift and nonprimitive-root cases. |
| 20 | `uniformized-level-chart` | verified | Proposition 4.1 changes an actual uniformization by a trace/root character; the family, monomial action and overlap comparison are imported from C4/H1/H3. |
| 21 | `hilbert-toroidal-model` | verified | Theorem 7.2(i) and its construction use the prescribed locally finite cusp formal relation and density/effectivity, not an arbitrary gluing of fans. The missing characteristic-zero valuation interface is honestly requested. |
| 22 | `toroidal-polarization-quotient` | corrected | Toroidal tame polarization action is free at the specified torsion-free level, unlike the minimal cusp action. Split the mixed Dimitrov/BHW citation into its own source records and distinguished open torsor evidence. |
| 23 | `hilbert-boundary-formal-comparison` | verified | The formal completion is the specified arithmetic toric boundary quotient with actual cyclotomic coefficients and full unit action; formal comparison is not an equality with the minimal completion. |
| 24 | `hilbert-boundary-etale-charts` | verified | Corollary 7.4 identifies actual-lattice toric charts étale locally and the nonopen strata over the stated fields. Freeness on these strata does not survive contraction. |
| 25 | `hilbert-regular-refinement` | verified | Cusp-equivariant regular refinement is imported from C3, measured in X*, and gives the stated good-prime smoothness; no discriminant-prime smoothness is claimed. |
| 26 | `hilbert-semiabelian-extension` | verified | Proposition 7.6 supplies the unique semiabelian extension and split rank-g torus at a cusp. Boundary p-divisible height need not remain the open abelian height 2g. |
| 27 | `hilbert-conormal-comparison` | corrected | Natural conormal line comes from the actual semiabelian extension and agrees on charts/overlaps. Split the BHW locator from the Dimitrov record and preserved the distinction from T5 modified lattices. |
| 28 | `hilbert-toroidal-proper` | verified | Theorem 7.7 uses the valuative criterion and split polarized period data after the allowed extension; R11.3 only covers positive residue characteristic, so the additional characteristic-zero contract is requested. |
| 29 | `hilbert-hodge-semiampleness` | verified | Theorem 8.6(i) is determinant-Hodge semi-ampleness for a positive parallel power; effectivity remains a precise C5 request, not a proved consequence of local toric charts. |
| 30 | `hilbert-minimal-contraction` | verified | Theorem 8.6(ii) uses the semiample determinant section ring and normal contraction; independence of the admissible fan is requested over the arithmetic base, not inferred solely on generic fibres. |
| 31 | `hilbert-minimal-finite-generation` | verified | Theorem 8.6 proof normalizes a Veronese section ring. The packet explicitly requests finiteness over the Veronese and finite generation, avoiding integrality-alone reasoning. |
| 32 | `hilbert-minimal-normal-projective` | verified | Theorem 8.6(iii) gives a normal projective finite-type minimal model through the supplied C5 section-ring geometry; connected fibres and π_*O=O retain their precise normal/proper hypotheses. |
| 33 | `minimal-polarization-quotient` | verified | The finite polarization quotient of the minimal model is normal/projective, with possibly nontrivial cusp stabilizers; no minimal étale torsor is asserted. |
| 34 | `hilbert-minimal-cusps` | verified | Theorem 8.6(iv) identifies finite étale arithmetic cusps with the prescribed cyclotomic invariant coefficient rings and codimension g; neither full stabilizer nor all cusp fields are made trivial. |
| 35 | `hilbert-minimal-boundary-fibres` | verified | Theorem 8.6(v) identifies whole geometrically connected toroidal boundary components as contraction fibres, not separate cones, using constancy of the abelian part from C5. |
| 36 | `hilbert-minimal-formal-comparison` | verified | Theorem 8.6(v) and formal functions compare the minimal completion via the whole toroidal inverse image. F0 proper/coherent/Noetherian hypotheses and adic completion of the pulled-back closed locus are used. |
| 37 | `hilbert-minimal-weight-extension` | verified | Theorem 8.6(vi) tests unit character triviality over the stated arithmetic base for g>1; the parallel-weight converse is not exported to arbitrary special fibres where characters can specialize. |
| 38 | `hilbert-q-expansion-comparison` | verified | Definition 8.4 and equation (5) identify actual weight-line-valued q-expansions with unit/root covariance at the chosen component. Scalar coefficients require the specified trivializing cover. |
| 39 | `hilbert-q-expansion-module-injective` | verified | Companion Proposition 7.3 proves module-valued detection using geometric irreducibility and prime-power thickenings; the directed-union repair avoids the invalid full-series colimit claim E-C6-3. General ramified charts come from Dimitrov, not the companion’s displayed nonramified formula. |
| 40 | `hilbert-q-expansion-injective` | verified | Fixed-component, fixed-weight q-expansion injectivity follows from the module-valued statement; geometric connectedness/irreducibility, flat line and the discriminant-inverted base are supplied explicitly. |
| 41 | `hilbert-q-expansion-coefficient-descent` | verified | Coefficient descent is for inclusions R⊂R′ and uses the quotient module plus flat-line exactness, without requiring R′ flat over R. Noninjective-map image statements remain a named gap. |
| 42 | `hilbert-boundary-ideal-pushforward` | corrected | Replaced the unsupported use of the Δ-inverted weight criterion in the base-B ideal theorem by proper flat geometrically connected/reduced boundary fibres and the explicitly requested global-function comparison. Added toric-chart/fibre/C0 prerequisites; left exact pushforward and projection formula give the result. |
| 43 | `hilbert-ordinary-model-comparison` | corrected | Integral ordinary models use the actual H2 Deligne–Pappas/Rapoport interface, including ramification and p=2; BHW alone supplies no smooth all-level integral compactification. Split the mixed-source locator. |
| 44 | `hilbert-hasse-boundary-comparison` | verified | Confirmed RT-AREA-padic-1/26 ownership: R07.2 owns generic Ha=det(V*), LF and BT₁ Hodge–Tate input; T0 extends to semiabelian degeneration, H2 instantiates it. Natural conormal and Hasse boundary trivialization agree. |
| 45 | `hilbert-boundary-ordinary` | verified | Split-torus Verschiebung acts invertibly on invariant differentials, hence the boundary Hasse ideal is a unit and cusp neighbourhoods are ordinary. The change of p-divisible height at the boundary is explicit. |
| 46 | `hilbert-near-ordinary-model` | verified | The ε<1 Hasse rational-domain convention is lift independent with the specified integral p^ε data; normalized admissible blowup removes p-torsion, and integral/formal/adic comparisons are requested. |
| 47 | `hilbert-ordinary-polarization-quotient` | verified | BHW Proposition 8.4/Lemma 8.5 give the finite effective tame polarization quotient on ordinary opens. Full wild-level comparisons use the mixed G-level problem and not this tame quotient. |
| 48 | `hilbert-p-level-boundary-comparison` | corrected | Distinguished canonical finite minimal/normalization extensions from toroidal extensions requiring compatible fans; finiteness requires a pullback fan/finite normalization. Added C0/C3 prerequisites and precise supplier requests; arbitrary refinements may be proper and nonfinite. |
| 49 | `hilbert-integral-differential-interface` | verified | BHW section 7.1 natural ω+ is the semiabelian conormal lattice pulled to the specified integral/formal/adic models. It is not equated with the later modified ωint lattice or a full quantitative canonical-subgroup result. |
| 50 | `modular-toroidal-minimal-comparison` | corrected | F=Q is compared to R13.4a’s actual coarse modular curves, using proper normal curve uniqueness only on the stated common base; integral blowups are not identified by generic equality. Split the supplier/BHW locator and labelled the supplier as a contract. |
| 51 | `modular-formal-cusp-comparison` | corrected | The formal/adic modular cusp comparison uses the actual Tate width parameter t with q=t^w, determinant/cusp fields and the permitted completions; arbitrary coarse cusp width one is not assumed. Split supplier/BHW citations. |
| 52 | `prime-diamond-pr81-comparison` | corrected | PR81 Layer 10 is restricted to prime N≥5 diamond H≤(Z/N)×/{±1} with its finite normal j-line and density hypotheses. General-level modular compactification remains R13.4a’s job; corrected the supplier locator and evidence scope. |
