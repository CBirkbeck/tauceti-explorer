# RT-RS-14 — independent attack on the p-adic L-function restructuring

Codex, session `codex-5ebb6f`; issue #4401; 30 September 2026.

The attack is complete. One **low-severity presentation finding** survives:
the reader report still describes the supplier and totals from before the
accepted review correction. I found no supported mathematical error, lost
construction, conflicting owner, lost prerequisite or cycle in the accepted
JSON. This is an assessment of the restructuring contracts, not a certification
of the future Lean constructions or a fresh extraction of their source papers.

## Inputs and independence

The author was Codex `codex-a71f92`; the reviewer was Claude Code `cc-442dc5`.
I did neither job. I read the complete proposal and report, its family definition
and the independent report `research/blueprint/reviews/REV-RS-14.md`, both member
READMEs, all fifteen member stage contracts, and all thirteen native reviewed
audit entries. The two checkpoints have no native audit entries.

The revision examined is repository base
`d4afbc98a4f6b289d730897edbd18171f5cafb67`. At that base the proposal under
`research/blueprint/restructure/` is identical to the accepted JSON under
`data/restructure/`. Input SHA-256 values:

| Input | SHA-256 |
| --- | --- |
| `research/blueprint/restructure/RS-14.result.json` | `0c4c5f5674b72a7113750332239f7fd14ae7d159b9d1847a25b017d9d59ffc26` |
| `research/blueprint/restructure/RS-14.md` | `30129ae877784d42ef9f1ac3eadde5a13ff7ad5a51b88243bf672a201dec8c89` |
| `research/blueprint/reviews/REV-RS-14.md` | `f863e1ae98e9b2668ff028cbc0061f6f89751b6b8502e6387181afd6146e432e` |
| `data/library-coverage.json` | `6fe73095d574e7f98497e0dcc0eeec3a9ab0a2c04b4eed98ded8e678a3adea7a` |
| `data/atlas.json` | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

The old graph commit recorded by the author is not in this checkout. I therefore
recomputed graph properties at the base above, rather than claiming to reproduce
the author's historical counts. I also read the relevant accepted RS-07,
RS-11, RS-13 and RS-16 contracts where they resolve outside ownership overlaps.

## Finding RT-RS-14/1 — the explanation predates its review correction

**Kind:** other. **Severity:** low.

**Where:** `research/blueprint/restructure/RS-14.md`, lines 23–24 and 47–51.

The report says that the JSON has “33 single-owner records” and “161 explicit
links”, and that classical continuation and conductor/Euler-factor interfaces
“import AnalyticNumberTheory AN.1”. Those statements describe the uncorrected
proposal. The accepted JSON has **34 owner records and 169 links**; D L0 imports
`UPSTREAM:Mathlib-Riemann-and-Dirichlet-L-functions` and
`UPSTREAM:Mathlib-DirichletCharacter-conductor-and-orthogonality` instead.

This is directly explained by `REV-RS-14.md`, lines 48–56: RS-07 drops AN.1;
the reviewer replaced its supplier entry, replaced one owner with two, and
replaced each of eight outgoing links with two upstream links. The proposal's
`review.corrections` records those same three edits. The accepted RS-07 entry
`layers[AnalyticNumberTheory:AN.1]` confirms the drop and the two suppliers.
There is no remaining AN.1 owner or supplier in the accepted RS-14 contracts.

**Fix:** update the reader report's current JSON totals to 34 and 169, and name
the two accepted upstream owners in the classical-boundary paragraph. Identify
the “144 new” number explicitly as a historical, pre-correction count, or
replace it with a count whose graph revision and treatment of nondrawn upstream
contracts are stated. The current graph results below supply such counts.

The correction is already present in the executable proposal. The finding
does not call for restoring the retired stage, changing mathematical ownership,
or modifying an existing Tau Ceti roadmap. Its effect is presentation, hence low.

## Retained targets and ownership attack

Write D for `DirichletPadicLFunctions` and A for `AutomorphicPadicLFunctions`.
All fifteen original IDs remain. Twelve contracts narrow; D `KU-zeta`, A `L3h`
and A `L4e` keep their scopes. D remains the rational construction, and A is its
explicit Part II. The roadmap prerequisite does not impose every later D stage
on the early ray-class construction.

| Stage(s) | Targets checked against the member documents; ownership boundary |
| --- | --- |
| D L0 | The RJW 2.4 Mellin argument, Bernoulli smoothing, embedding-dependent algebraic-value comparison, and Dedekind meromorphic-germ/residue comparison remain. Classical continuation and conductor interfaces use the two accepted upstream owners. AL.1 supplies adelic GL1 continuation and its pole; the general Bernoulli/Gauss input comes from existing ModularForms Layer 0. GlobalNumberFields 9–10 supplies the idele-character dictionary. |
| D L1 | The explicit integral smoothing construction, cancellation before division, moments, restriction-to-units Euler factor, auxiliary-parameter independence and regularity of the pseudomeasure remain. The k=1 value and zero Euler-factor case are not discarded; odd-prime parity and dyadic conditions remain distinct. Generic transform/pseudomeasure operations import PadicMeasures L2/L3. |
| D L2 | Actual tame and p-power twists, conductor/Euler conventions, Gauss calculations and coefficient-field descent remain. Importing a generic measure operator does not replace these arithmetic proofs. |
| D L3 | Analytic branches, the normalized logarithm comparison, the cyclotomic-unit formula at 1, conductor cases, pole-coordinate comparison and dyadic integrality remain. Coleman L0 supplies the logarithm; Coleman L3 consumes this comparison, so the reciprocal overlap does not create a proof cycle. |
| D L4 | The p-stabilized Eisenstein construction for its stated weights, finite Dirac approximants, constant coefficient and coefficient specializations, and tame integral q-expansion congruences remain. Classical modular forms are imported; general geometric families are not rebuilt here. |
| A L0 | The p-power inverse ray-class limit, unit-closure/torsion quotient, Leopoldt-defect dimension, chosen embeddings and avatar descent remain. Finite ray carriers and reciprocity alone are not claimed to construct this limit. PadicMeasures L0a owns representability; LocallyAnalyticDistributions L3 owns Mellin/evaluation on that space. |
| A L1/L2 | BSW cycles, periods and evaluation survive with degree r1+r2 and the rational comparison. Distribution coefficients and actual eigenlifts retain the noncritical slope inequalities, p-level normalization, unit descent and controlled growth. Generic modular-symbol/control interfaces are imported without replacing the general-field constructions. |
| A L3 | The Hilbert Eisenstein/Deligne–Ribet construction retains algebraicity, integral q-congruences, denominator bounds, smoothing/Euler factors and Shintani comparison. Its Q specializations import D L1/L2/L4. The ordinary CM/Katz operators, periods and any required characteristic-zero lifts remain explicit obligations. Igusa IG.1 is imported only for its special-fibre scope. |
| A L3h | Hsieh's ordinary CM type, square-root distribution whose square interpolates central values, root-number and conductor conditions, residual and character-image hypotheses, and the finite-exception/density distinction remain intact. This kept layer is not replaced by the rational measure construction. |
| A L4 | EHLS's actual ordinary anti-holomorphic modules, period-valued output and named hypotheses survive. PEL, compactifications and bundles supply their actual carriers. The additional ordinary mixed-characteristic tower, coherent lifting, differential operators, integral expansions and zeta-integral proofs remain here when the suppliers do not furnish them. |
| A L4e | Eischen–Wan's finite-slope Klingen construction, odd split prime and auxiliary data remain. The r=2 constant-term divisibility stays a divisibility, rather than an unrestricted equality. |
| A L5 | The analytic CPR/Panchishkin existence problem is a proposition with its data, not an existence constructor. Selmer L4 owns realization/criticality/local-condition data; ModularIwasawaMainConjectures L5 imports the analytic proposition and retains its separate arithmetic main-conjecture task. |
| D KU-zeta; A KU-hilberteisenstein | Original source-unit aggregation remains. The latter consumes the actual A L3 construction and original Iwasawa prerequisites; neither checkpoint asserts a new proof or implementation. Weight-two quaternionic forms do not replace the general Hilbert q-expansion construction. |

I read all 34 owner records, all 169 link endpoints and their reasons, and the
complete descriptions of the 24 distinct outside atlas supplier stages. Two
additional supplier identifiers are upstream contracts, not atlas stages.
Each of the six family evidence entries belongs to one of three reciprocal
pairs: D L1, L2 and L4 supply A L3's Q comparisons. There is no circular plan
to derive D's initial objects from the later general-field theorem.

The current thirteen audit entries contain **27 directed duplicate records**.
These were all checked, including the old AN.1 reference resolved by RS-07,
the PM-L0a/LAD-L3 character-space overlap resolved by accepted RS-16, the
Coleman/integral-Iwasawa comparison obligations, and the analytic/arithmetic
CPR distinction in accepted RS-11. These audit records are overlap leads:
they do not require moving an entire stage merely because it uses the same
construction. The retained versus imported boundaries above resolve the leads
without asserting that an audited missing target is implemented.

## Positive pinned-library checks

I read the actual statements of these fourteen declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti's supplied baseline is
`f790474821cf4256814db967cb154e7af3d0c369`. These checks concern reusable
interfaces; I make no new exhaustive library-absence claim.

| Declarations | Source and boundary checked |
| --- | --- |
| `riemannZeta_neg_nat_eq_bernoulli'`, `riemannZeta_neg_nat_eq_bernoulli` | `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:240,251`; the k=0/Bernoulli convention must be retained rather than inferred from a positive-weight formula. |
| `DirichletCharacter.gaussSum_mulShift_of_isPrimitive` | `Mathlib/NumberTheory/DirichletCharacter/GaussSum.lean:57`; nonzero modulus, primitive multiplicative character and domain hypotheses are actual inputs; the additive character is arbitrary. This is not itself an unrestricted composite-conductor nonvanishing theorem. |
| `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum` | `Mathlib/Analysis/Fourier/ZMod.lean:220`; complex values and primitive character, with the minus sign in the Fourier argument. |
| `DirichletCharacter.changeLevel`, `.conductor`, `.IsPrimitive`, `.primitiveCharacter` | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:66,246,292,307`; the conductor and level-change carriers already exist. |
| `DirichletCharacter.LFunction_changeLevel` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:150`; nonzero levels, divisibility and the nonprincipal-or-s-not-1 qualification matter for the Euler-deletion comparison. |
| `EisensteinSeries.q_expansion_bernoulli`, `EisensteinSeries.E_qExpansion_coeff` | `Mathlib/NumberTheory/ModularForms/EisensteinSeries/QExpansion.lean:298,323`; even k with 3≤k, and the normalized constant coefficient. The arithmetic measure normalization still requires its scalar comparison. |
| `NumberField.dedekindZeta`, `.dedekindZeta_residue`, `.tendsto_sub_one_mul_dedekindZeta_nhdsGT` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49,56,77`; the series and explicit class-number expression exist. The last theorem is a real one-sided limit. D L0 correctly retains the stronger meromorphic-germ comparison instead of treating this limit as complex meromorphic continuation. |

## Consumers and executable graph checks

I read all 26 outside consumer stage descriptions and their prerequisite lists
(identical checkpoint blocks were checked once with equality and their separate
prerequisites checked individually). There are 30 original outward edges into
11 roadmaps: AutomorphicCongruences, BorelRegulators, ColemanIntegration,
ColemanPowerSeries, EllipticRegulators, GeneralizedHeegnerCycles,
IntegralIwasawaTheory, ModularSymbolsPadicLFunctions, PadicFamilies,
RankZeroOneBSD and SpecialValuesBirchTate.

On the original graph I enumerated every consumer of every narrowed layer.
For each `suppliedBy` owner I checked an edge to the narrowed layer and every
one of those consumers, allowing an already present edge and avoiding a
self-edge. **No forwarding contract was missing.** I separately applied
`scripts/restructure.py` in memory and used an independent DFS to check cycles:

| Check | Result at the stated base |
| --- | --- |
| Original member stages covered | 15/15; 12 narrow, 3 keep; no hidden member stage |
| Owner records / proposed link pairs | 34 / 169; no duplicate link pairs |
| Ten earlier accepted families, then RS-14 | 136 new drawable edges; 16 nondrawn upstream contracts |
| Every other accepted family, then RS-14 | 131 new drawable edges; the same 16 nondrawn upstream contracts |
| Cycle checks | No cycle in the original graph or either resulting graph |
| Original stage edges | All retained |
| Existing Tau Ceti stage content | ID, owner, key, title, description, source path/line and parent ID unchanged |

All skipped links have one of the two upstream identifiers as their source;
they are recorded contracts with no atlas stage to draw. No valid atlas-stage
link was skipped because it closed a cycle. Five links in the second application
were already supplied by other accepted proposals, explaining its lower count.
These current results do not rewrite the independent review's historical graph
claim. They establish that the accepted correction remains safe in the current
graph as well.

## Validation and limits

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-14.result.json`
and `python3 research/blueprint/intake.py check-files` on the two deliverables
pass. JSON parsing and `git diff --check` pass. Only the two issue-authorized
report files are added; target inputs are unchanged. No Lean compiled. This job
produces no Lean file and does not establish the unimplemented mathematical
constructions by compilation.
