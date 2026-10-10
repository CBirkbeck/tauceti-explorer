# Independent review of the second algebraic K-theory fix

Job `REV-FIX-RT-AREA-ktheory-2~2`, issue [#5159](https://github.com/CBirkbeck/tauceti-explorer/issues/5159).
Reviewer: Codex, session `codex-mcmkKW`, 2026-10-10.
Fix author: Codex, session `codex-rtOQ9t`; this reviewer did none of that fix.

The review is complete. Two packet corrections are accepted; six packets need
changes for the specific mathematical or supplier gaps below. These verdicts do
not declare any roadmap implemented or proof-closed. The existing partial
coverage, unchecked implementations, requests, source issues and historical
reviews are preserved. Successful elaboration establishes the consistency of
the expressible suggested signatures, including admitted proofs; it does not
supply omitted mathematical interfaces or prove the statements.

The inputs are the full finding and verification files and
`RT-AREA-ktheory-2.fixes-2.md`. The fix addressed /1–46, excluding the verifier's
rejected /34. The report also accounts separately for /47–52, which the fix
explicitly excluded. Current accepted suppliers were read because several
September handoffs have since been implemented at planning level. Their reviews
are not replaced here: they are outside this issue's allowlist.

## Packet verdicts and required changes

| Packet | Verdict | Exact boundary |
| --- | --- | --- |
| EllipticKTheory | needs_changes | /1 has the right five-term higher-degree argument, but affine function-field Steinberg homology and low-degree prime-to-characteristic tame-kernel/exact-reciprocity inputs still have source/proof gates. The accepted E.5 part gives precise contracts rather than completed supplier proofs. |
| HabiroNumberFields | needs_changes | /2's early theorem is correctly conditional. HB.9 still consumes it as unconditional. Assemble compatible normalized evaluations after HB.4 and retarget that consumer; resolve /14's Keune and finite-module proof gates and /18's concrete early finite-Chern supplier. |
| EllipticRegulators | needs_changes | /6 needs a concrete early Kato L1 symbol/norm interface; /7 needs the early generic real-Deligne supplier before any whole-stage import. Existing character-specific and vertical-integrality proof gaps remain. |
| Polylogarithms | needs_changes | /24 still has no adopted early real-Deligne complex/regulator contract. A request to the unsplit late M.8 does not supply it. P.2's ideal geometry and tetrahedron identity remain explicitly unclosed; the exact scalar is still R.7's. |
| K3BlochGroups | accepted | The assigned finite-field map corrections, Milnor/product ownership, arithmetic imports and proportionality boundary are right. This verdict covers those corrections, preserving the packet's unrelated gaps. |
| K2SymbolsBrauer--T.1 | needs_changes | /19–20 have the right owner. The earlier area-1 /30 rejection remains: `G-Hopf` and `G-natural-Hopf` lack the discrete Hochschild–Serre low-degree sequence and map-level comparison. This review does not erase that rejection. |
| ArithmeticKTheory--N.1 | needs_changes | The affine/proper finite-generation and Keune contracts are now explicit. Original GQ82 integral Steinberg homology and Keune's exact hypotheses/proof/finite-module translation remain unread source gates. |
| SchemeAndStackFoundations | accepted | /38's stale SF.2 ownership instruction is corrected to import the current accepted S.4 fallback foundation. Henselian construction and unrelated SF targets remain open; no duplicate generic Nisnevich theory is planned. |

Every previous top-level review is appended intact to `reviewHistory`. Each new
review names this job, its predecessor, its checked scope, its corrections and
its remaining obligations. Existing `status` and coverage fields are retained;
an inherited `complete` label is not a new assertion of proof closure.

## Corrections made in this review

1. In E.5/harder-finiteness, higher Milnor vanishing now imports
   `K2SymbolsBrauer:T.2:symbols/milnor-global-positive-characteristic` directly.
   T.5's request is narrowed to the distinct degree-two tame-kernel theorem.
   The finite-field gap description follows this distinction. The newer E.5
   part still needs its stale T.5 higher-Milnor pointer reconciled by its owner.
2. N.3/function-field-steinberg-finiteness imports AlgebraicCurves Layer 5's
   finite-constant-field class-number argument and affine bridge, plus the
   pinned `ClassGroup.equivPic`. A matching request records the full constant
   field and nonempty finite boundary. This replaces an unreferenced Jacobian
   argument and does not replan the existing Riemann–Roch consequence. GQ82
   integral homology remains the separate gap.
3. SF.2's confirmed /38 record and coverage now name
   `SchemeKTheoryOperations:S.4/nisnevich-site` and
   `S.4/nisnevich-distinguished-square-criterion` as the accepted fallback
   owner. A future approved transfer must replace that owner and retarget
   consumers. The update distinguishes ordinary/strict henselizations and
   Čech/hyperdescent; it adds no duplicate carrier.
4. The local-model adapter in EllipticKTheory's suggested file now explicitly
   binds the marked regular proper model, height-one place and localization,
   retaining the section's scalar-tower assumption. An `include` command did
   not bind the missing
   explicit model/place parameters in an admitted definition. Calls now use
   the named base-ring argument. The redundant section `include` is removed;
   the scalar-tower instance is captured once, without an additional explicit
   binder that would cause an overlapping-instance warning. The generic-fibre
   marking
   equation and map comparison are retained.

No reader, integrated atlas, link map, reserved-ID register, external packet or
upstream roadmap is edited. Reader synchronization of these three packet-side
corrections belongs to those deliverables' owners; the reports and packet
reviews state the actual scope.

## Finding-by-finding decisions

“Correct” below means the assigned statement/ownership correction is correct,
not that all of its supplier proofs are complete. “Open” gives the precise
remaining work; an external handoff is not silently counted as applied.

| Finding | Decision and evidence |
| --- | --- |
| /1 | **Open, with local correction.** Weibel IV.6.9, chapter p.59, distinguishes Q73 from GQ82. VI.6.1, p.37, needs finite generation, higher Milnor vanishing, Geisser–Levine and low-degree tame reciprocity. The N.3 affine/proper nodes give the finite-boundary localization passage. E.5 includes the necessary preceding K-group in its five-term argument. Imported the existing AlgebraicCurves Picard finiteness and T.2 higher-Milnor owner. Original GQ82 and the degree-two tame-kernel proof remain source gates; III.7.2(a) proves only the degree-at-least-three Milnor result. Preserve E1/E2. |
| /2 | **Early correction correct; downstream application open.** Hutchinson v4 §3, Theorem 3.1, pp.5–6, gives the Chern evaluation; CGZ v3 Theorem 7.4, pp.37–39, obtains the R evaluation using Nahm asymptotics and Andrews–Gordon. The early HB.2 implication now assumes both evaluations and CRT compatibility, avoiding HB.4→HB.2. Current HB.9/constant-term-is-the-unit still calls this conditional node without supplying those premises. A downstream assembly is required, preserving the sign issue and δ correction. |
| /3 | **External handoff present at planning level.** Current RT.1 has separate Devalapurkar–Raksit, image-of-J and Devalapurkar-comparison nodes. The comparison keeps p>2, the spherical base, Frobenius/action conventions and the distinct p=2 E1 statement. Its accepted review is evidence for the supplier contract, not a fresh source-proof review by this job. |
| /4 | **Correct.** The E.3 rational injection imports N.2 and finite-generation/rank consequences: each closed residue field is a number field; a direct sum of torsion groups is torsion without a uniform exponent. The finite-field integral injection retains T.2/k2-finite-field. These are different statements. |
| /5 | **Correct ownership and specialization.** ER.5 imports CM.1/CM.4 and AL.1, retaining the maximal-order class-number-one E/ℚ specialization, conductor/bad factors and finite Fourier data. It does not reconstruct the generic CM character. |
| /6 | **Open supplier.** ER.7 correctly retains the Kato L0 units and requests only the early L1 K2-symbol/norm/descent interface, rather than the whole late Euler-system stage. The named early export still has to be supplied. Character-specific boundaries, Manin–Drinfeld, regulator and pushforward remain ER work. |
| /7 | **Open supplier; duplication correction correct.** ER.2 imports P.5's symbol/regulator form and requests a generic early real-Deligne prefix. The concrete elliptic dimension, embedding, period and torsion-lift work remains. The unsplit late M.8 cannot be inserted as a prerequisite. |
| /8 | **Correct contract.** ER.1 requests current C5/C6 Betti–de Rham and Hodge/conjugation interfaces. Brunault Lemmas 61–62, printed pp.64–66, use F²H¹=0, the twisted real conjugation and Poincaré/Hodge pairing. The application retains its orientation and lattice conventions. |
| /9 | **Correct, conditional scope.** For the stated completion, substituting s=0 in Λ(s)=wΛ(2−s), with Γ(s)~1/s, gives L*(0)=wN(2π)^(-2d)L(2). R29.6's E/ℚ scope is not promoted to an unconditional general-number-field theorem. The CM Hecke route remains separate. |
| /10 | **Correct prerequisites, retained proof gap.** ER.8 imports ER.5's U/L-value theorem and E.6 regular-model/vertical-integrality contract. It does not infer arithmetic integrality from generic-fibre unramifiedness. |
| /11 | **Correct ownership.** Coleman L1, D.5 and modular-symbol L1/L2 remain separate suppliers, with period/exceptional-factor and ordinary/supersingular qualifications. The elliptic comparison is an application, not a second p-adic L-function construction. |
| /12 | **Correct; Lean signature repaired.** E.7 and E.8 arithmetic certificates depend on E.6's marked regular proper model and vertical residues. ER.6's potential-good-reduction application stays distinct. The adapter now binds the intended place/model and elaborates. |
| /13 | **Correct.** Hutchinson v2 Corollaries 3.6–3.9, pp.14–15, and Corollary 7.5, pp.34–36, support the actual finite-field stabilization/Hurewicz map and natural enhanced-Tor sequence. The characteristic is inverted in unstable homology; q≥4 and the q=2,3 exceptions remain. CGZ §4.2, pp.23–24, uses odd distinct p,q and q≡−1 mod p^m. The norm-one Cartan map and cyclic bar image are named; equal orders are not substituted for map identification. |
| /14 | **Open proof gate, corrected convention.** CGZ Lemma 3.5, p.20, uses twisted Pic/p^m coinvariants for Keune, then a finite-module vanishing argument for Pic[p^m] invariants, Kummer p-units and total ramification to eliminate valuations. N.6/HB.1 preserve those differences. The original Keune hypotheses/proof and the module comparison still need inspection; a citation at the use site is not that proof. |
| /15 | **Correct consumer request; supplier handoff remains.** HB.7 imports D.1 with the Li₂+(1/2)log(z)log(1−z) normalization and the p>3 unramified integral scope. GSWZ Definition 1.3, p.9, and §3.1 motivate this input. D.1→D.2 and V.4→D.2 comparison work must retain the actual regulator, not just its five-term relation. |
| /16 | **Correct packet; coarse integration remains a handoff.** HB.6 imports HR.1 Frobenius and HC.3/HC.4 substitutions/gluing without M.1. Removing obsolete coarse M.1/KU pointers and retargeting forwarded finite-Chern data is maintainer work. No integrated graph is edited or certified here. |
| /17 | **Correct.** HB.1 imports V.3's CGZ/Suslin convention comparison with 2-/6-primary and odd-coefficient qualifications. The coarse HABIRO pointer is a maintainer update. |
| /18 | **Open early finite-Chern supplier.** HB.1/HB.2 request finite coefficients, twists, Kummer normalization, products and base change, without a whole M.8 edge. Hutchinson v4 §2.3, pp.4–5, specifies the finite-coefficient sequence and Soulé product formula. M.5d/D.1 must import the adopted early contract; the sign discrepancy is retained. |
| /19 | **Correct existing owner.** T.2:symbols already states the number-field (ℤ/2)^r1 and positive-characteristic global-field vanishing contracts. Weibel III.7.2(a),(d), pp.61–62, supports their different scopes. V.2 imports the number-field theorem; E.5 now directly imports the positive-characteristic theorem. No second T.4 proof is added. |
| /20 | **Correct.** T.2:graded-map owns the graded Milnor-to-Quillen product. V.2 retains degree-three specialization, the decomposable image and indecomposable cokernel. |
| /21 | **Correct consumer; common supplier remains an obligation.** V.5 imports L.1 finite-field restriction/transfer, keeps both composites and the invariant-image condition, and asserts no canonical cyclic generator. Supplier direction is L.1→V.5. The excluded L.1 packet is not given a verdict here. |
| /22 | **Correct import boundary.** V.5 requests N.5/N.8 for ℚ, ℤ and ℚ(i), retaining the noncanonical free-summand qualification. N.8 lies outside this N.1 packet; integration remains a maintainer handoff. |
| /23 | **Correct.** V.6 imports P.2's nonzero rational proportionality, reserving the exact scalar/sign for R.7. Early algebraic quotients/certificates and late regulator formula are distinct contracts, avoiding opposite whole-stage imports. Goncharov's Theorem 1.1 states rational proportionality, not the newly asserted exact normalization. |
| /24 | **Open real-Deligne supplier.** P.5 requests a generic early complex, products, conjugation and regulator definition while retaining its Goncharov current complex and comparison. Its explicit no-owner/prefix gaps remain valid: a request is not an adopted supplier. |
| /25 | **Correct P.2 ownership; geometry/proof gates retained.** P.2 owns the oriented tetrahedron/Bloch–Wigner identity. Current Tau GeometricTopology layers 7/8 supply ambient metric/model foundations, not the entire ideal-boundary/tetrahedron construction. Goncharov p.7 states the comparison; no proof closure is inferred from that statement. QT.5 must consume P.2 and retain manifold gluing. |
| /26 | **Correct distinction, external interface handoff.** P.6 asks I.2 for the completed-unit map/strong Leopoldt. The ordinary diagonal unit map is injective; prime-to-p torsion dies on pro-p completion. Weak cyclotomic, strong injectivity and the abelian Baker–Brumer theorem remain separate. The official NSW PDF link redirected to its landing page during this run; no fresh NSW proof reading is claimed. |
| /27 | **Correct local ownership, maintainer reconciliation open.** P.1 owns analytic D and its five-term relation; V.3 retains integral convention/torsion comparison. Old analytic V.3 reservations and incoming references need one adopted replacement in the reserved-ID register, outside this issue. |
| /28 | **External import present.** Current RT.5 imports the RT.4 q-Hodge/Habiro interfaces before the Meyer–Wagner application, retaining HQ.3 through the supplier route. No duplicate q-Hodge construction is requested. |
| /29 | **External multiplicative scope now explicit.** Current RT.5/high-powered requires odd prime exponents zero or at least two, and the 2-exponent zero or even at least four. The d⁴ divisibility argument gives coinitiality. H.6 must supply coherent multiplicative Moore data; arbitrary underlying cofibre spectra are not E∞ rings. |
| /30 | **External planning contracts present.** Current RT.1 distinguishes solid spectra, solid perfect-even modules and solid even filtration, with the extra lift/evenness hypotheses. A solid module alone is not the required filtered equivariant ring construction. Its accepted review, not this job, covers that source proof. |
| /31 | **External import present.** RT.4:Habiro-comparison/number-field-habiro imports HR.6/the-degree-zero-identification. The source normalization remains Wagner Corollary 3.13; do not revert to 3.12. |
| /32 | **Correct handoff.** The accepted RS-33 early H.5:spectra interface and H.5:S-delooping reexport supply spectrum-level smash/operadic data. K.7's K-product remains later. This review does not reintroduce a dependency on late EDS comparisons for the early model. |
| /33 | **External owner present; arithmetic consumer handoff.** RT.2/genuine-tc-agrees owns bounded-below genuine/modern TC comparison, including the classical model witness. L.4 specializes it for fields/DVRs; it must not reconstruct that comparison. |
| /34 | **Verifier rejection retained.** Bökstedt construction and the finite-field THH periodicity calculation are distinct. The fix correctly did not delete L.5 periodicity. |
| /35 | **External scope separation present.** Current RT.3 separates relative connective/nonconnective criteria and the nilpotent comparison from henselian rigidity. The later CMM/Part II input must not become a reverse prerequisite of the early theorem it uses. |
| /36 | **External syntomic import recorded.** RT.6 uses PR.4's actual syntomic interface, with completeness/base hypotheses and its comparison, rather than identification of two names. Its accepted RT.5 review covers that supplier contract. |
| /37 | **External DD import present.** RT.1 imports DD's exterior/cotangent/Koszul/de Rham contracts for HKR. The imported differential complex does not itself prove the HKR equivalence; factorial and smoothness conditions remain in that theorem. |
| /38 | **Corrected to current owner.** Accepted S.4 has a generic site and distinguished-square criterion: empty value zero and qcqs Čech descent, separate from Noetherian/dimension-dependent hyperdescent. SF.2 now records the fallback import instead of demanding a duplicate definition. Ordinary henselian and strict henselian points remain distinct. |
| /39 | **External geometry imports present.** Current S.5 regular-blowup-geometry imports R09.7a/R09.1, and projective-bundle constructions import R09.1. The K-theoretic blowup/projective-bundle formulas remain S applications, with their regular-immersion hypotheses. |
| /40 | **External generality boundary retained.** Current S distinguishes qcqs derived direct image and proper/coherent/perfect pushforward. Tau StableReduction Layer 2 and JacobianChallenge C are read in their curve/proper-flat scope; arbitrary general-scheme consequences need the separate Stacks/TT contracts. No curve theorem is generalized here. |
| /41 | **Maintainer graph handoff remains.** False S.6→M.4/Z.5 and S.7→Z.6 dependencies must be removed from integrated/forwarded graphs. The correct inputs are cycle theory for M.4, S.6 for M.6b, Z.3/S.2 for Z.5, and S.2/S.5 for Z.6. Packet checker success is not a receipt for changes in those excluded graph files. |
| /42 | **Correct.** N.2 imports S.3 localization and preserves finite-support/extension and degree-specific arithmetic consequences. Current S.3 supplies supported nonconnective localization with the qcqs/quasi-compact-open hypotheses. N.2's regular Dedekind specialization still needs its field-colimit and dévissage bridges. |
| /43 | **External corrected scope present.** Current RT.4 distinguishes integral unstable K/BU operations from the stable E∞ maps on KU[1/k] and ku[1/k]. In integral periodic KU, invertibility of β prevents a unital operation taking it to kβ for nonunit k. Completion similarly requires k a unit. |
| /44 | **External import present; current upstream checked.** RT.1 imports DGAInfinity Layer 8 Hochschild/derived-Morita construction and keeps cyclic operators, Connes B, mixed complexes, completed totalizations and SBI. Current DGAInfinity Layer 9 gives Chern/Hochschild pairing only with its specified smooth/proper algebra or chosen-generator comparison scope, not unrestricted category claims. |
| /45 | **External import present; current upstream checked.** S.1/perfect-module-complex imports DGAInfinity Layer 5 compact/thick/retract characterization. It handles right modules versus Mathlib left modules via Aᵒᵖ, retaining the scheme-local Perf(Spec A) comparison and P7 specialization. |
| /46 | **External functor contracts present.** Current RT.3 relative-trace imports K.5 relative fibres and the actual connective/nonconnective functors. Products remain actual K.7/H.5 data where required. No additional E∞ refinement is inferred merely from multiplicativity. |

## Later findings excluded by the fix

These are not retroactively charged to its /1–46 completion claim. They remain
separate owner/integration work; the full claim and verification were read.

| Finding | Current boundary |
| --- | --- |
| /47 | T.4 belongs at the reciprocity/transfer/symbol consumers E.4/E.5/E.7 and ER.4, not as a mathematical input to E.2 K0. Coarse-edge retargeting is outside this issue. |
| /48 | ER integrality must inspect Schappacher–Scholl 1991 and its erratum in addition to the 1988 modular-curve paper. Brunault §3.10, printed p.135, routes elliptic integrality there. The older unread integral-image/vertical gaps are preserved. |
| /49 | Current V.3 uses x≠0,1 correctly. The older reader/audit phrase “nonunit” must be corrected by its owner: nonzero elements of a field are units. Those files are outside the allowlist. |
| /50 | HB.1 concerns units/S-units of F(ζ_n) modulo nth powers, not the subgroup of cyclotomic units. Current packet statements preserve that distinction; audit/reader wording and the irrelevant cyclotomic-unit library pointer remain separate work. |
| /51 | P.4 records weight four as a theorem with an explicit proof/ownership gap, not as an established proof in this packet. An adopted Part II or complete owner plan for the Goncharov–Rudenko proof is still required. |
| /52 | Parent RT.4 and KU checkpoint title/description cleanup is an atlas/integration change, not a correction made by this fix review. |

## Sources and baseline checks

Sources below were downloaded from their public author/arXiv hosts. The locators
distinguish the separate Weibel chapter PDFs from the packet's older combined
draft. Only the indicated material was freshly checked, not every proof of every
node. Statements and decisions above are written in this reviewer's own words.

| Source/version | Material checked | Public URL |
| --- | --- | --- |
| Weibel, author Chapter III | III.7.2(a),(d), chapter pp.61–62 | [Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) |
| Weibel, author Chapter IV | IV.6.9 and preceding criterion, chapter p.59 | [Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) |
| Weibel, author Chapter VI | VI.4.7, p.20; VI.6.1/proof and low-degree preamble, p.37 | [Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) |
| CGZ, arXiv v3 | Lemma 3.5/proof, p.20; §4.2, pp.23–24; Theorem 7.4 and evaluation proof, pp.37–39 | [1712.04887v3](https://arxiv.org/pdf/1712.04887v3) |
| Hutchinson, refined Bloch–Wigner v2 | Corollaries 3.6–3.9, pp.14–15; §6.4, p.33; Lemma 7.4/Corollary 7.5, pp.34–36 | [1107.0264v2](https://arxiv.org/pdf/1107.0264v2) |
| Hutchinson, Chern class v4 | §2.3 product/finite-coefficient conventions, pp.4–5; §3/Theorem 3.1, pp.5–6 | [2104.14413v4](https://arxiv.org/pdf/2104.14413v4) |
| GSWZ, Habiro v2 | Definition 1.3 and its formal-completion convention, p.9 | [2412.04241v2](https://arxiv.org/pdf/2412.04241v2) |
| Brunault thesis v1 | §2.5, Lemmas 61–62 and proofs, printed pp.64–66 | [math/0602186v1](https://arxiv.org/pdf/math/0602186v1) |
| Goncharov, regulators v3 | Weight-two cross-ratio/ideal-volume statement, p.7; §2 current-form conventions, p.21 | [math/0207036v3](https://arxiv.org/pdf/math/0207036v3) |

The official NSW author landing page linked a PDF that redirected back to the
landing page. No substitute copy was used and no fresh reading of NSW 10.3.6 is
claimed. Original GQ82, Keune and the Schappacher–Scholl integral-image proofs
were not obtained here. Their existing gates are preserved explicitly.

The reviewed `data/library-coverage.json` entries for these eight directions
were read before changing any prerequisite. All named baseline references were
checked against a fresh declaration index scanned from the shared pinned source
trees. Statement inspection concentrated on the changed/contested citations:
`ClassGroup.equivPic`, the infinite-place/unit rank interfaces, the S-unit
Selmer kernel, the local unit filtration and the Weierstrass arithmetic Euler
product/L-series. The latter does not supply analytic continuation or a
functional equation; the Selmer kernel is not Keune's Picard injection; the
local unit filtration is not a global pro-p completed-unit carrier.

Current read-only TauCetiRoadmap AlgebraicCurves README and Suggested.lean were
read for the Layer 5 finite-class-number import; DGAInfinity Layers 5, 8 and 9
were checked for Perf/Hochschild/Morita scope, including its current narrowed
Layer 9 pairing statement. Relevant ClassFieldTheory/StableReduction contracts
and the current Tau Ceti library were also inspected. Nothing was run or changed
in the current read-only roadmap/library checkout. Current-library additions are
not misrepresented as declarations present at the older atlas pins.

## Validation receipts

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; the shared `lean-check` build uses
these pins. The Mathlib source HEAD was verified. The Tau source tree is the
shared pinned snapshot, not a Git checkout; its pin is the build wrapper's
recorded baseline.

`python3 scripts/check_blueprint.py` was run on all eight packets, with the
fresh pinned declaration index: **zero errors and zero warnings**. No link map
or restructuring proposal is a deliverable under review, so the corresponding
checkers are not applicable. All packets have zero source `excerpt` fields;
none were added. No source file or source passage was copied into the repository.

Every suggested file was checked sequentially with `lean-check`, after checking
available memory. The seven initially successful files were not needlessly
recompiled. EllipticKTheory was rechecked after its adapter repair.

| Suggested file | Final exit | Errors | Only `sorry` warnings |
| --- | --- | --- | --- |
| EllipticKTheory | 0 | 0 | 84 |
| HabiroNumberFields | 0 | 0 | 241 |
| EllipticRegulators | 0 | 0 | 343 |
| Polylogarithms | 0 | 0 | 462 |
| K3BlochGroups | 0 | 0 | 807 |
| K2SymbolsBrauer--T.1 | 0 | 0 | 68 |
| ArithmeticKTheory--N.1 | 0 | 0 | 124 |
| SchemeAndStackFoundations | 0 | 0 | 362 |

Definitions introduced by this fix: none. Its seven new theorem nodes have
statements, hypotheses, source locators, prerequisite contracts and mathematical
acceptance tests. Their remaining source/proof frontiers are the reason for the
needs_changes verdicts above, not something hidden by the schema checker.
The accepted finite-field nodes additionally import the current map-level
stabilization, enhanced-torsion and Cartan interface nodes. No executable test
of an unstated higher-K carrier is claimed.
