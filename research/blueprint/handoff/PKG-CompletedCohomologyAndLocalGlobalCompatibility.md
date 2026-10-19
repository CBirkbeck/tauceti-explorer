# PKG-CompletedCohomologyAndLocalGlobalCompatibility

Completed by Codex, session `codex-2jsUrj`, for #10762 on 2026-10-19.
The bot confirmed the claim before work began. This is a complete package submission, not a checkpoint.

## Deliverables and scope

The package contains README.md, Suggested.lean and metadata.toml (`math.NT`).
The README is the definitive roadmap: all 49 accepted targets across six layers,
106 named API entries, 57 named definition tests, the other mathematical Checks,
and all 22 selected-planet targets are retained. Each layer ends in Examples and
Dependencies. The accepted packet, original reader and suggested interface are unchanged.
No atlas, consumer, supplier or upstream repository files were edited.

The suggested file is deliberately representative: seven light definitions over
pinned carriers, five admitted theorem statements, one proved specialisation
lemma and proved discriminating examples. There are no admitted data definitions,
heavy placeholder carriers, wrapper support predicates or private multiplicity-Hom
carriers. Arithmetic towers and local Langlands families stay in the README.
The Lean module introduction explicitly says that it is not exhaustive.

## Library and ownership audit

Read the relevant current read-only upstream roadmaps at roadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27`,
and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
ProfiniteArithmetic, LocalGaloisGroups and ModularCurves do not already provide
these arithmetic completed-tower comparisons. SmoothRepresentationsOfLocalGroups
SR.5 already owns co-Whittaker families, their top derivative and coefficient
endomorphisms; only the exact integral smooth-dual mod-p fibre comparison is extra.
OperatorTheory does not replace complete-local integral representation categories.
The package reuses CC.0–CC.8's carriers and finite-level arithmetic suppliers.


Read the source of all 31 baseline declarations at the pinned Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti's pin is
`f790474821cf4256814db967cb154e7af3d0c369`. Additional carrier checks include
Representation.IntertwiningMap, ContIntertwiningMap and
PrimeSpectrum.zeroLocus_eq_univ_iff. Generic completion, Mahler approximation,
ideal kernels, topological closure, finite-module support and tensor products
are imports. The scalar-annihilator lemma in §5.3 is an arithmetic proof step,
not a new support construction. No direct Tau Ceti declaration is used by the
small representative file, so its only import is `import Mathlib`.

Ownership moves retained from the accepted plan: pro-modular primes and nice
primes move down from GL2ModularityLifting into §§3.8, 5.7; Emerton's global
locally algebraic argument stays downstream of R30 in §6.3. Tung's Breuil–Mézard
identities proved by global patching are exported here rather than imported
from R30.6. ScholzeFunctorAndModpCohomologyOfTheLubinTateTower now has an accepted
design: import SZ.0–SZ.1 only, and let SZ.4–SZ.6 consume §4.12. No higher-tier
lifting theorem is a prerequisite.

## Target map and adversarial mathematics pass

Every row identifies the accepted target's package location and the boundary
instances used to inspect its definitions, identities and theorem hypotheses.
These are mathematical checks in addition to elaboration. Heavy arithmetic
Checks are roadmap proof obligations; they are not reported as implemented tests.

| Accepted node (R31 prefix) | README | Instances, conclusions and corrections |
|---|---|---|
| `R31.1/the-object-the-conjecture-is-about` | §1.1 | Ramified O, exponent s=1, zero multiplicity target and tame versus p-level order. Keep integral lattice and completion before tame colimit; no replacement generic tower. |
| `R31.1/arithmetic-actions-and-admissibility` | §1.2 | Trivial tame quotient versus quotient of p-power order. Averaging is rational; no unsupported integral invariant comparison. Finite-level Hecke endomorphisms commute with Galois, not a nonexistent full G-action. |
| `R31.1/degree-zero-two-and-compact-support` | §1.3 | Degree zero, compact versus ordinary supports, and p-power transition maps. Keep the boundary and determinant action; no finite-level BM H₂ vanishing claim. |
| `R31.1/non-eisenstein-boundary-and-injectivity` | §1.4 | Eisenstein residual 1⊕ε, p=2, non-neat levels and pro-p versus arbitrary compact level. Keep the dyadic boundary input, CM-induced exceptions and pro-p freeness condition. Compute level-11 Frobenius-2 polynomial mod 3. |
| `R31.1/shimura-curve-completed-cohomology` | §1.5 | Small stabilisers with nonzero H⁰, degree parity, and division versus split group at p. Finite-level descent also requires non-Eisenstein H⁰ vanishing; CDN parity is not imposed on every quaternionic curve. |
| `R31.1/definite-quaternionic-completed-module` | §1.6 | Trivial central character, rational central scalars, inverse translation and ramified coefficient exponents. Incompatible rational character forces zero E-valued forms. General F uses the central closure, not a discrete raw quotient. |
| `R31.1/definite-quaternionic-tower-structure` | §1.7 | Empty X gives s=0; nonfree stabilisers and accumulating rational units defeat the free-orbit argument. Restrict raw manifold/free-action assertions to Q. Add Pan Proposition 3.2.4 norm-character condition explicitly. |
| `R31.2/locally-algebraic-vectors-of-completed-cohomology` | §2.1 | Trivial algebraic weight, dual scalar t⁻¹, equal versus distinct weights, and ordinary versus compact supports. Keep the coefficient dual and cohomological normalisation. |
| `R31.2/density-of-algebraic-vectors` | §2.2 | Zero localised space versus nonzero classical algebraic vectors, and fixed central character with incompatible weights. Density has the specified Banach topology and allowed algebraic weights. |
| `R31.2/classical-eigensystems-in-completed-cohomology` | §2.5 | Weight two versus weight one, level-11 a₅=1 and a₂=−2, and geometric versus arithmetic Frobenius. Preserve symmetric-power dual, tame level and determinant ℓSℓ. |
| `R31.2/completed-homology-with-coefficients` | §2.6 | Trivial W, nontrivial smooth τ, rational versus integral coefficients and possible finite-level BM H₂. Replace a misleading descent argument by compact-support duality and Poincaré duality; keep Tate twist (1), and (2) after Kato’s extra twist. |
| `R31.2/definite-quaternionic-classical-forms` | §2.7 | Trivial W gives invariants; a nontrivial scalar weight at a fixed point forces zero. Keep W* and the tame level. Complete finite-dimensional Hausdorff topology is explicit in the Lean representative. |
| `R31.2/type-specialised-quaternionic-modules` | §2.8 | Trivial type with compatible centre, incompatible type, zero localisation and rank before versus after localisation. Retain finite-coset smallness and central compatibility; finite-level typed module is not patched. |
| `R31.3/completed-hecke-algebra-of-the-modular-tower` | §3.1 | Zero Hecke image, finite-level versus completed algebra and tame restriction direction. Use the CC.8 carrier, not a second inverse limit; retain reducedness and integral torsion-freeness. |
| `R31.3/hecke-galois-determinant-and-representation` | §3.2 | Weight-two and weight-k determinant, reciprocal Frobenius, reducible residual trace and zero ring. Keep ℓSℓ. Pan ψε⁻¹ and Tung ψ_Tε are separate until a dual/Hecke dictionary is proved. |
| `R31.3/deformation-to-hecke-surjection` | §3.3 | Surjection onto zero algebra and reducible residual pseudo-character. Trace/determinant generators give surjectivity; no representation reconstruction in the reducible case. |
| `R31.3/rho-bar-part-and-commuting-actions` | §3.4 | Zero residual summand, allowable versus nonallowable level and integral localisation. Use closed residual projectors and retain commuting actions. |
| `R31.3/galois-factorisation-of-completed-cohomology` | §3.5 | Zero target and the failed evaluation injection for trivial G, V=E². Keep absolute irreducibility/scalar endomorphisms in Galois factorisation and the separate integral comparison. |
| `R31.3/classical-points-and-zariski-density` | §3.6 | Dense set on a reduced ring versus a nilpotent thickening. Density proves equality of maps only with the stated reducedness/separatedness; fixed-type density is not density in every deformation component. |
| `R31.3/definite-quaternionic-hecke-algebra` | §3.7 | Zero localisation, pro-p versus arbitrary finite level and Pan/Tung determinants. Use finite-level images and central quotients with the exact dimension input. |
| `R31.3/eisenstein-localisation-and-pro-modular-primes` | §3.8 | Unit ideal, zero Hecke quotient, identity quotient and inclusion of primes. Kernel containment is specialisation-closed; no pro-modular prime exists for T=0. Eisenstein generators alone do not prove maximality/nonvanishing. |
| `R31.4/local-langlands-families-over-the-hecke-algebra` | §4.1 | Empty Σ₀, reducible local restriction, p=2 and mod-ϖ duality. Empty co-Whittaker tensor is T, its coadmissible smooth dual T′. Integral reduction of the dual is a separate supplier theorem. |
| `R31.4/fibres-of-the-away-from-p-family` | §4.2 | Empty set of non-generic primes, scalar Frobenius and ratio ℓ±¹. Level lowering uses the Eisenstein component group and bad-reduction torus identity; weak multiplicity precedes the refined theorem. |
| `R31.4/multiplicity-module` | §4.3 | Zero target, trivial G with V=E², V=0 in cancellation, and nonsaturated ϖO⊂O. Evaluation and coadmissible tensor comparison are separate; C.51 needs V≠0 and C.52 an injective saturated composite. |
| `R31.4/refined-local-global-compatibility` | §4.4 | Scalar residual, nonsplit scalar-endomorphism case and split distinct characters. The latter gives some θ, not an unjustified canonical-family identification. Keep non-scalarity for the converse evaluation criterion. |
| `R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses` | §4.5 | Nondistinguished residual case, split/character-self-extension characteristic-zero restriction, and Σ with extra ramification. Nonzero, embedding and full adelic isomorphism remain three separate conclusions. |
| `R31.4/mod-p-multiplicity-and-serre-s-adelic-reformulation` | §4.6 | p=2, scalar residual and good/boundary weights. Keep p>2, the integral away-from-p mod-p comparison and the exceptional multiplicity qualifications. |
| `R31.4/dual-local-global-compatibility-for-completed-homology` | §4.7 | p=3 versus p≥5 projective-envelope inputs and the dual Tate twist. Correct locator to Nakamura Corollary 2.5; p=3 removal-of-envelope extension remains explicit. |
| `R31.4/quaternionic-multiplicity-module` | §4.8 | Zero localised functions, compact Schikhof dual and nonzero residual vector. Finite generation is not freeness; support is empty for zero target. |
| `R31.4/definite-quaternionic-local-global-compatibility` | §4.9 | Classical crystalline point, missing local absolute irreducibility and zero fibre. Keep the universal family and closed-image/density arguments; positive multiplicity uses weak compatibility. |
| `R31.4/block-multiplicity-module` | §4.10 | Disjoint block, zero object and single supersingular block. Projective generator is for the whole block; use a finite central map, not a general integral centre isomorphism. |
| `R31.4/pan-semisimple-local-global-compatibility` | §4.11 | p=2, excluded p=3 block, reducible local characteristic-zero point and F=Q. Explicitly require p odd; classicality needs irreducibility at every v|p. Correct Lemma/Proposition labels in the Iwasawa argument. |
| `R31.4/scholze-functor-and-completed-cohomology-of-shimura-curves` | §4.12 | Split versus division quaternion invariants, nonzero H⁰ and torsion coefficients. Import only SZ.0–SZ.1; arithmetic comparison is here and SZ.4–SZ.6 consume it. |
| `R31.5/ceggps-patched-module` | §5.1 | Zero versus nonzero specialised Banach representation and p dividing 2n. Keep p∤2n and global choices; no independence or general nonvanishing assertion. |
| `R31.5/type-specialised-patched-modules` | §5.2 | Wrong type gives zero, support on one component, and nongeneric smooth local factor. Keep union-of-components conclusion and genericity for the stated locally algebraic description. |
| `R31.5/patched-support-is-a-union-of-components` | §5.3 | R=k[x,y]/(xy), M=R/(x); R=k[ε]/ε², M=R/(ε); zero span. Distinguish projected/full support, nilpotent/zero annihilator and auxiliary components. State the commuting-action annihilator-span lemma on existing carriers. |
| `R31.5/full-support-odd-p` | §5.4 | p=3, exceptional nonsmooth unrestricted ring and reducible closed characteristic-zero point. Corollary 3.10 separately covers every closed fibre. Do not infer formal smoothness for every crystalline weight. |
| `R31.5/quaternionic-patched-completed-homology` | §5.5 | No auxiliary variables, reduction modulo augmentation and compatible central character. Retain actual definite arithmetic modules and odd real conditions; nice-prime patching is not the irreducible-residual theorem. |
| `R31.5/full-support-dyadic` | §5.6 | p=2 with scalar residual local restriction and ordinary components. Keep non-solvable modular global image; nonordinary support alone is insufficient. Exact dyadic ordinary seed/components are prerequisite. |
| `R31.5/pan-patching-at-a-nice-prime` | §5.7 | Prime omitting p, dimension≠1, split residual lattice, bad dihedral intersection and nonconstant tame lift. Keep all five nice-prime conditions and character-changing component transfer; dimension alone does not give full support. |
| `R31.5/pan-residually-irreducible-patching` | §5.8 | p=3 exclusions and residual modularity omitted versus assumed. Retain all five hypotheses; invoking the Q full-Serre consequence changes the dependency. |
| `R31.6/promodularity-and-the-consequences-for-classical-and-overconvergent-forms` | §6.1 | p=2, equal Hodge–Tate weights and split equal residual characters. Keep separate residual exclusions and the promodular versus odd/full-Serre branches. |
| `R31.6/boeckle-r-equals-t` | §6.2 | Nilpotent kernel, reducible local residual restriction and irreducible Fontaine–Laffaille k>2. Density-to-injectivity retains reducedness. Correct the argument to the DFG weight range, not only weight two. |
| `R31.6/global-proof-of-locally-algebraic-vectors` | §6.3 | Equal weights, unramified twists, different filtrations with the same WD/weights and det exponent ratio on diag(2,1). Globalise a representative with the same WD/weights. The exact formula remains conditional on the named normalisation and full CM weight-occurrence inputs. |
| `R31.6/quaternionic-globalisation-of-supercuspidal-types` | §6.4 | Principal series versus supercuspidal, tame inert-p residual character and regular inert-ℓ datum. Auxiliary CM form need not already have the requested π; global character extension remains required. |
| `R31.6/globalisation-dependence-audit` | §6.5 | Residual modularity assumed versus inferred from oddness, and uninspected globalisation leaves. Serre-independence is relative to the exact supplier hypotheses, not certified for all leaves. |
| `R31.6/export-table-for-gl2-lifting` | §6.6 | Odd-p, dyadic and residually reducible consumers. No export drops its source hypotheses; no upward dependency on a lifting consumer or global-patching result back into R30. |
| `R31.2/mod-p-serre-weights-and-genericity` | §2.4 | Boundary r=p−1, scalar residual restriction and a missing predicted weight. Keep non-scalarity for derivative/genericity, goodness for derivative, and only the upper-bound inclusion. Evaluation at p uses reciprocity. |
| `R31.2/global-serre-weights-and-good-weights` | §2.3 | Interior r<p−1 versus r=p−1 with overlapping determinant weight; empty occurrence set. Goodness is global occurrence plus the explicit boundary condition, not the predicted local set. |

The Lean and README generalities are stated separately where appropriate:
translation and central-character predicates allow general topological modules;
weighted duality requires a complete nontrivially normed field and finite-dimensional
Hausdorff topological module; algebraic multiplicity evaluation is over an arbitrary
field; the arithmetic cohomology applications require O to be the integers of a
finite extension of Q_p. Equal-characteristic DVRs are not claimed as arithmetic
coefficients. Zero spaces are allowed in algebraic evaluation and free-orbit statements,
but are excluded where tensor cancellation or nonvanishing needs them.

## Supplier work retained explicitly

The accepted plan records 18 gaps. Packaging does not prove those missing theories
or claim closure of their source proofs. They are represented by exact hypotheses,
comparison targets and supplier specifications in the README. The old “pending
Scholze design” description is replaced by its accepted stages, without claiming
those planned stages are implemented.

| Accepted gap | Package treatment |
|---|---|
| Scholze’s functor is not planned | Scholze SZ.0–SZ.1 contract; §§1.5, 4.12; no SZ.4–SZ.6 prerequisite. |
| Extensions of the existing local p-adic Langlands contracts | R30.2–R30.5 specifications; §§4.1–4.11 and §§5.3–5.6; p=3 envelope/removal extension remains explicit. |
| Eisenstein maximal ideal for the ordinary Hilbert Hecke algebra | Further input 5; §3.8; maximality/nonvanishing require the L-value congruence input. |
| Uninspected globalisation leaves | Further input 9; §6.5; exact automorphic/adequate and dyadic globalisation hypotheses, not an unconditional independence claim. |
| Emerton’s functional analysis and coadmissible modules | CC.3 specification; §§4.3–4.4, 4.7; nonzero C.51 factor and injective saturated C.52 composite. |
| Böckle’s density theorem and Diamond–Flach–Guo not read | Further input 10; §§6.1–6.2; Böckle/DFG through Nakamura Theorem 2.1 and EM11 §7.3, with reducedness and weights 2≤k≤p. |
| Emerton’s Theorem 6.1.2 cites a manuscript in preparation | SR.5 specification; §§4.1, 4.6; integral smooth-dual fibre is not inferred from co-Whittaker existence. |
| Non-Eisenstein H^0 vanishing for the quaternionic Shimura tower | Further input 2; §§1.5, 4.12; localised H⁰ vanishing is needed for descent. |
| Dictionary between the quaternionic determinant conventions | Further input 11; §3.2(c); panTungGaloisNormalization retains duality, reciprocity and Hecke data. |
| Gelfand–Kirillov dimension input for Pan’s Hecke bound | R03.6 and further input 6; §§4.11, 5.7; corrected Pan lemma/proposition locators. |
| Small-weight reduction, mod-p multiplicity one and Ihara genericity | Further input 7; §§2.3–2.4, 4.4, 4.6; exact small-weight, Hecke-socle, derivative and Ihara inputs. |
| Auxiliary CM globalisation needs the full weight occurrence statement | Further input 8; §6.3; every chosen predicted auxiliary CM weight must actually occur. |
| Normalisation comparison in the global locally algebraic formula | Further input 11; §6.3; globalAlgebraicNormalization is required before exporting the exact determinant twist. |
| Unrestricted framed-ring irreducibility and auxiliary components | R08.1 specification; §§5.3–5.4; unrestricted framed ring, all odd p, plus auxiliary-component choices. |
| Dyadic ordinary component theorem is outside the present R21 contract | R21 specification; §5.6; ordinary seed, determinant, local components and base change at p=2. |
| General definite quaternionic finite-level adapter | R18.3 and further input 3; §§1.6–1.7, 2.7–2.8; general F, finite ramification, nonparallel weights and closure of rational units. |
| Prescribed Hecke-character existence in the CM globalisation | Further input 8; §§6.3–6.5; R17.5 prescribed local Hecke-character extension remains conditional. |
| Dyadic non-Eisenstein cusp-boundary calculation | R14.3 and further input 4; §1.4; p=2 coefficient-system cusp-boundary calculation. |

In particular this package does not certify Böckle/DFG's original proofs or the
uninspected Calegari/Snowden/KW/Paškūnas/Emerton–Gee/BLGG globalisation leaves.
Their exact citing-source formulations and hypotheses are retained. An independent
review should verify those boundaries, rather than interpret the complete package
status as a claim that every supplier gap has been discharged.

## Sources and corrections

All 14 freely available primary PDFs listed in the accepted packet were read as
needed for the mathematical targets and their critical comparisons; each downloaded
file's SHA-256 matches that packet's specified version. No library book was needed,
and no source file or source passage is included in the repository. README formulations
are in our own words, with theorem/section/page locators and links to those versions.

The accepted source corrections remain visible mathematically: determinant ℓSℓ;
the unavailable EM11 reference [42] replaced by the precise smooth-dual fibre input;
DLB's tame-level and CM Galois-character corrections; Nakamura Corollary 2.5;
the distinction between canonical and θ-family compatibility; det^b versus det^(b+1);
and nonzero/injective-saturated tensor hypotheses. Additional source checks corrected
Pan §3.6 lemma labels, the norm-character condition of Proposition 3.2.4,
Nakamura's compact-support duality proof, Tung's all-closed-point nonvanishing,
and the weight range in EM11 §7.3's use of DFG. These are changes to package
statements/proof sketches, not edits to the accepted packet.

## Validation

- `lean-check research/blueprint/packages/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean`: exit 0 at the pinned shared build; exactly five “declaration uses sorry” warnings, for functions_free_finite_orbits, weightedForms_equiv, isProModular_iff_comap, multiplicityEvaluation_injective and annihilator_span_eq. Every example is proved; no other warning or error. Available memory was checked before elaboration; no language server or Lake build/update/cache command was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CompletedCohomologyAndLocalGlobalCompatibility.json`: 0 errors, 0 warnings; 49 nodes, 106 API entries, 57 unit tests, 22 planets.
- Name inventory: all 106 API names and all 57 named test names occur in the README; all 49 target sections are mapped above. All six layers end with Examples and Dependencies.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems.
- `git diff --cached --check`: passed after staging all four new files.

The package is ready for its independent package review. There is no unfinished
worker task or checkpoint resume step. The supplier obligations above remain
mathematical prerequisites for the eventual formalisation.
