# REV-RS-07: independent review of analytic number theory and arithmetic statistics

**Verdict: accepted with the in-place corrections below.** This accepts the ownership proposal, not completion of any mathematical proof or blueprint. Reviewer: `independent-review-REV-RS-07`, Codex — `codex-c83e7a`, 2026-09-21. Refs #813.

The author of [RS-07](../restructure/RS-07.md), ChatGPT — `g6-astra-20260921-r7c4`, is a different worker; the original claim is recorded on [issue #814](https://github.com/CBirkbeck/tauceti-explorer/issues/814#issuecomment-5761302126), submitted in #927. The corrected [proposal](../restructure/RS-07.result.json) has the required top-level review object. Its final inventory is three member roadmaps, two unchanged anchors, 22 layer decisions (6 keep, 13 narrow, 3 drop), 32 ownership entries and 58 supplier links.

## Inspection and evidence boundary

Read all three member READMEs and all 22 layer descriptions, both complete anchor READMEs and their layer descriptions, all 29 family overlap leads, the original proposal/report, the reviewed coverage records for these five roadmaps, and both accepted decompositions: ten AnalyticNumberTheory nodes and eight ArithmeticStatistics nodes. Also inspected the relevant outside-family supplier/consumer stages: AC.4, AL.0–3, CN.4, ES.4, GN.4, ML.3, PS.1, PM.0 and GlobalNumberFields layer 9. Checked stage edges against the full atlas, excluding the already retired roadmap in `data/roadmap-retirements.json`.

The review uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Direct statement checks included:

- [L-series convolution](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Convolution.lean), `LSeries_convolution'`, requires summability of both factors; [differentiation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Deriv.lean), `LSeries_hasDerivAt`, requires being strictly right of the abscissa of absolute convergence. [Abel summation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/AbelSummation.lean), `sum_mul_eq_sub_sub_integral_mul`, retains interval differentiability and integrability of the derivative.
- [Dirichlet continuation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/DirichletContinuation.lean): `LFunction_eq_LSeries` is on `Re(s)>1`; `LFunction_changeLevel` includes the finite Euler product and excludes the simultaneous principal-character/pole case; `IsPrimitive.completedLFunction_one_sub` requires primitivity and includes the conductor power, inverse character and root number. [RiemannZeta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/RiemannZeta.lean) supplies the classical function, functional equation and RH proposition. The latter is a statement, not a proof.
- [Nonvanishing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/Nonvanishing.lean) supplies the closed-half-plane result with its pole exclusion; it does not supply a quantitative zero-free region. [DedekindZeta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/DedekindZeta.lean) supplies a real right-limit residue, not the missing complex continuation/boundary comparison.
- [Mellin inversion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinInversion.lean), `mellinInv_mellin_eq`, retains positivity, convergence, vertical integrability and continuity. [HurwitzZeta](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/HurwitzZeta.lean) uses `UnitAddCircle`; `hasSum_expZeta_of_one_lt_re` confirms the exponential-series convention behind the proposal's factor `z*Phi(z,s,1)`.
- [SelbergSieve](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/SelbergSieve.lean) already supplies weighted sieve data, the main/error upper bound and the lambda-squared upper-Mobius construction. Weight normalization at 1 and the distinction between weight truncation and remainder-sum distribution control must survive.
- [Tau Ceti SelmerGroup](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean): the explicit carrier does not itself prove Selmer finiteness. The rank estimate assumes finite generation and a finite subgroup containing the descent image. EC.7 remains the owner of the general Selmer/Sha exact sequence, including work still planned there.

Other coverage remains supported by the reviewed audits; no library recompilation was attempted. Tate and Kedlaya proof readings and hashes are inherited from the accepted decomposition, not claimed as fresh primary-proof readings. Re-fetched Bhargava–Shankar [arXiv:1006.1002v3](https://arxiv.org/pdf/1006.1002v3) (SHA-256 `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf`) and checked Proposition 2.6, printed p.12, and the height comparison on p.22. This targeted check does not close the packet's unread imports.

## Corrections made

1. **Preserve the accepted quartic interface at ST.0.** Its source node includes I/J polynomials, relative weights, discriminant, eligible invariant pairs and quartic height. These were obscured by the original shared-invariant wording. ST.0 now explicitly owns them and the comparison to EC.8's canonical curve height. EC.8 retains its height carrier and isomorphism-class finiteness theorem.
2. **Make that boundary consistent everywhere.** ST.1 is narrowed to import the named quartic interface, retaining remaining integral invariant theory, orbit bijections, inverses, stabilizers, exceptional loci and local-solubility/Selmer comparisons. Added a unique ST.0 ownership entry and the existing ST.0 → ST.1 prerequisite explicitly; corrected both Statistics → AN.8 descriptions. The EC.8 → ST.1 link no longer assigns the same height comparison ambiguously to “ST.1/ST.0”. This direction respects the existing foundational dependency.
3. **Specify the actual lattice estimate.** The GN.4 ownership entry, GN.4 → ST.2 link and ST.2 rationale now name Davenport's bounded-semialgebraic-multiset estimate, including projection-volume error and uniform complexity dependence. GN.1's convex-body bounds and GlobalNumberFields' fixed-domain homothetic estimate are insufficient substitutes for the moving regions in the accepted counting argument. This assigns the missing theorem; its proof remains an obligation.
4. **Give the orbit-to-Selmer comparison one owner.** ST.4's retained scope now says that it uses ST.1's comparison. ST.1 constructs that comparison; ST.4 constructs the family average and statistical consequences.

These are the complete edits to mathematical decisions. Existing roadmap actions, the three deletions, immutable anchors and the other supplier assignments remain accepted.

## Duplication and preservation findings

All 29 leads are resolved, including reciprocal records:

| Lead group | Review finding |
| --- | --- |
| AN.0 / ADS.0,1,3,6 | Library rational carriers and ADS ideal refinements/Perron account for all removed foundations. |
| AN.1 / SV.2 (both directions) | Composite-modulus character theory is a library input; large-sieve estimates remain SV.2. |
| AN.2 / ADS.9,10 | Generic Tauberian/transfer theorem stays in the anchor; quantitative input construction and instances remain AN.2. |
| AN.3 / ADS.6 and SV.3 (both directions) | Perron is imported, zero analysis stays AN.3, BV averaging stays SV.3. |
| AN.4 / ADS.7,10 and ST.3 (both directions) | Density/transfer are anchor inputs; analytic comparison differs from statistics over fields. |
| AN.5 / ST.5 (both directions) | Different sample spaces, measures and moment theorems; no deletion justified by shared model terminology. |
| AN.6 / SV.2,3,4 (both directions) | Remove the export wrapper; actual estimates, distribution hypotheses and tuple statements have named producers. |
| AN.8 / ST.1 (both directions) | Integral orbits and analytic zeta integrals differ; corrected invariant boundary imports ST.0 as well. |
| ST.0 / EC.8 | General family conventions and comparisons survive; canonical elliptic height is imported. |
| ST.1 / EC.6 | Binary-quartic orbits are not the etale-algebra square-class presentation; the comparison remains new work. |
| ST.4 / EC.6,7 | Per-curve descent/exact sequence are inputs to a new family-average theorem. |

The stage preservation ledger in RS-07.md was checked against all member descriptions. In particular: AN.5 retains the Beurling branch; AN.7 retains general Lerch parameters/branches; AN.8 retains several-variable analytic local-integral work; AN.9 retains both spectral zeta and Bost–Connes/KMS branches. ST.1 retains nonmaximal, reducible and degenerate loci; ST.2 retains cusp and infinite-local-condition tails; ST.3/5 retain class-group and higher-moment work. SV.0 retains missing lower bounds, SV.1 the fundamental lemma/parity limitations, SV.2 the actual large-sieve inequalities, SV.3 the full BV quantifiers, SV.4 the admissible-tuple bounded-gap theorem, and SV.5 the distinct weighted/Chen/affine-sieve hypotheses. None becomes implemented by assigning an owner.

### Reviewed source-node preservation

The accepted packets remain **partial**. Their source IDs, hashes, proof-reading flags, corrections, coverage and gaps must survive integration. The original AN migration table is accepted with all its caveats:

| Accepted AN node suffix | Destination |
| --- | --- |
| `completed-zeta-functional-equation-via-theta` | Library import/provenance with normalization comparisons. |
| `dirichlet-L-functional-equation-with-gauss-sum-and-parity` | Library import/provenance, preserving composite modulus, parity, conjugation and Euler corrections. |
| `classical-zero-free-region` | AN.2, including unresolved height-range qualifications. |
| `von-mangoldt-explicit-formula-and-pnt-error` | AN.3, including contour/truncation and endpoint obligations. |
| `adelic-zeta-integral-and-admissible-class` | AL.1, preserving the full Z1–Z3 lane. |
| `riemann-roch-and-lemma-A` | AL.1, importing AL.0 Poisson theory. |
| `global-functional-equation-and-class-number-residue` | AL.1 analytic theorem; AN.4 ideal-series comparison. |
| `local-functional-equation-gamma-factors-and-root-numbers` | AL.1 with measure/different/conductor conventions. |
| `hecke-L-function-euler-product-comparison` | AN.4 importing AL.0–1, GlobalNumberFields and ADS. |
| `artin-induction-versus-artin-holomorphy` | AN.4, preserving the near-line limitation and unread inputs. |

AL.0–1's Schwartz–Bruhat wording must not discard Tate's more general admissible-class record. Likewise the multiplicative covolume is kappa, and vanishing residues need not give actual poles. Artin holomorphy remains distinct from a meromorphic continuation route. A Dirichlet-density argument alone does not establish the accepted node's stated natural-density consequence.

The previously omitted Statistics migration is:

| Accepted ST node suffix | Destination |
| --- | --- |
| `invariants-height-and-eligible-pairs` | ST.0 for quartic data/comparison; EC.8 for canonical curve-height carrier and finiteness. |
| `binary-quartic-parametrization-of-two-selmer` | ST.1; import EC.6/7 and prove the geometric comparison. |
| `embedding-into-pairs-of-ternary-quadratic-forms` | ST.1, retaining equivariance and fiber-bound imports. |
| `averaging-over-the-fundamental-domain-and-cutting-the-cusp` | ST.2 arithmetic argument; GN.4 generic Davenport lemma. |
| `uniformity-estimate-for-infinitely-many-congruence-conditions` | ST.2, retaining strong/weak divisibility and all sieve/Thue inputs. |
| `quoted-classical-counts-for-binary-quadratic-and-cubic-forms` | ST.3 with source and group/weight distinctions. |
| `average-size-of-the-2-selmer-group-is-three` | ST.4, using ST.1 and EC inputs. |
| `rank-bound-from-the-selmer-average` | ST.4 statistical deduction, importing the per-curve rank input. |

Preserve all nine Statistics node links. Where a bundled node is split, retain a provenance cross-reference and retarget its mathematical dependency to the appropriate owner. In particular, ST.0 invariants → ST.1 parametrization → ST.2 counting → ST.4 averaging remains directed forward. The parametrization proofs, Davenport proof, uniformity imports, class-group source selection and higher-moment gaps remain open. The first-moment source does not close ST.5.

## Integration and validation

The Part II title exactly uses the ADS title. The extension consumes ADS summation/conditional transfer and starts with genuinely additional analytic input construction; it neither reconstructs the anchor nor adds a reverse prerequisite into it. Both listed anchors remain `keep`; no anchor layer is edited and no proposed link targets a Tau Ceti stage.

Apply the original report's removals before inserting links. The full-atlas check finds ten edges to remove:

- Every edge incident to AN.0, AN.1 or AN.6: CA.0 → AN.0; AN.0 → AN.1/PM.0/SV.0; FF.1 → AN.1; AN.1 → AN.2/AN.7/PS.1; AN.5 → AN.6.
- AN.3 → SV.2, before reversing this dependency for the large-sieve input to zero density.

All five surviving consumers of deleted stages have direct replacements: PM.0 and SV.0 import arithmetic-function APIs; AN.2, AN.7 and PS.1 import the existing continued zeta/Dirichlet interfaces, with the additional suppliers recorded in the proposal. AN.6 has no stage consumers. Outside-family narrowed-stage repairs for CN.4, ML.3, ES.4 and AC.4 are explicit; ST.1/4 and AN.8 have their direct suppliers.

Validation performed against main `20d1ccf0963e10489900bedc72800993a1b84090`:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-07.result.json` passed.
- `python3 research/blueprint/intake.py check-files research/blueprint/restructure/RS-07.result.json research/blueprint/reviews/REV-RS-07.md` passed.
- Scratch checks confirmed exact member/layer inventories, unique owner targets and links, valid supplier IDs, explicit links for retained narrowed-layer suppliers, immutable anchors and replacement imports for every surviving consumer of a deletion.
- Full-atlas reachability check used 3,458 existing active stage edges, the ten removals and all 58 proposal links: no newly introduced edge has a return path. This makes no claim that every pre-existing atlas component is acyclic.

No Lean file is requested or changed; Lean was not run. No generated atlas, queue, original report or accepted decomposition is edited.

## Questions and delivery note for the orchestrator

1. The full instructions on #813 explicitly require correcting the proposal in place and adding its review object. However `queue.json` lists only this Markdown report in REV-RS-07's outputs. `intake.py`'s `own_files` therefore excludes `RS-07.result.json`, although both submitted paths are explicitly authorized by the issue. Please reconcile that metadata and process/rerun intake; the worker has not changed queue metadata or merged anything.
2. When applying the proposal, enforce the removal ledger and the 18-node preservation map, including the retained Tate Z lane and the split Statistics interfaces. Preserve existing source gaps; assigning GN.4 the precise Davenport contract only resolves its ownership gap.
3. Carry the clarified GN.4, ST.0/ST.1 and ST.1/ST.4 boundaries into subsequent blueprint work. Application may need to split bundled source records; that is orchestration work and must preserve their provenance and independent-review corrections.
