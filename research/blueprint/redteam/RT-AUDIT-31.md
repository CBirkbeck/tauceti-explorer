# RT-AUDIT-31 — accepted library audit red team

Agent: Codex — codex-hjdg0j. Read on 2026-09-24 against explorer `f52ac6c69e8439cf27a5356b7554c67f3046499a`. Independent of AUDIT-31 and REV-AUDIT-31. Status: complete.

Rechecked all 47 layers, 160 targets, 98 citations (76 distinct declarations in 65 pinned files) and 59 duplication references. One medium ownership error: upstream EllipticCurves explicitly excludes the ramification-theoretic conductor identification assigned to it by R01.3. No change to the 44 not-built / 3 process verdicts or the 151 absent / 9 partial target classifications is supported by this check.

## Scope and reproducibility

- Independence: this worker did neither AUDIT-31 nor REV-AUDIT-31. Read the accepted audit, its review and all five full roadmap documents; compared every target with its layer contract and checked all 47 stage descriptions against those documents. All 47 current stages have entries; 160 targets comprise 151 absent and 9 partial. The 44 mathematical not-built verdicts and 3 process verdicts are coherent with the contracts.
- Read all 98 citation occurrences through their 76 distinct declaration statements, including namespaces and governing variable/typeclass hypotheses, at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. All 98 match the baseline index on library, name, file and line. All 65 cited files were fetched from their pinned raw URLs and matched the local search copies byte for byte. No Lean compilation is claimed.
- Checked every one of the nine partial targets: continuous operator carriers and their missing group-variable continuity/framing; algebraic symmetric/exterior powers versus topological tensor induction; End(V) conjugation versus ad^0 and scalar quotients; finite-quotient ingredients versus the finite-coefficient equivalence; restriction/coinduction/dual/base change; decomposition maps versus choice independence; point-count Euler factors versus Tate-module comparison; and elementary prime estimates versus the exact Serre-proof inequalities. Existing ingredients do not constitute the full target.
- For all 151 absent targets, searched the pinned declarations.tsv first and then both full Lean trees using 22 concept/synonym families. The report maps every layer to those searches, records the expressions and results, and distinguishes related infrastructure from the missing arithmetic statement. This is a reproducible search assessment, not a theorem that no alternate implementation can exist.
- Arithmetic searches: invariant/stable lattices, finite coefficients, tensor induction/restriction of scalars, polarization/oddness/adequacy/enormous image, tame/fundamental characters, Weil groups/Weil-Deligne/quasi-unipotence/monodromy, Artin/Swan conductors and upper numbering, Hasse-Arf/Ogg/Tate algorithm, Dickson and bad/good-dihedral images, absolute irreducibility, Brauer-Nesbitt/semisimplification/Schur index, Chebotarev recognition and Tate modules/Weil pairing. Read the Specht, base-change and auxiliary-prime near matches; none supplies the missing general arithmetic target.
- Automorphic searches: modular/Hilbert/Shimura cohomological Galois construction, Kuga-Sato/Eichler-Shimura/Deligne-Serre, purity/compatible systems, de Rham/crystalline/semistable Galois properties, polynomial laws/Hecke determinants/reconstruction, algebraicity/Satake, trace formula/endoscopy/nearby cycles, eigenvarieties/Fredholm/slopes, rigid/overconvergent/dagger cohomology and local Langlands/monodromy bounds. Read cited newform, etale-cohomology, polynomial-law, period-ring, Weyl-module, valuation-spectrum and dominance-order statements; none supplies these constructions.
- Serre and completed-cohomology searches: the named Khare-Wintenberger, Kisin, Skinner-Wiles, Buzzard-Wiese, Rohrlich-Tunnell, Dieulefait-Pacetti and Snowden/Schoof inputs; weight reduction, good-dihedral primes, small ramification and sharp prime estimates; modular towers, Iwasawa algebras, locally analytic/algebraic vectors, Emerton/Paskunas and patching/deformation rings. Checked the actual hypotheses of Bertrand/Chebyshev/Dirichlet, ordinary continuous group cohomology, Amice transform and IsProP citations. General finite-group Iwasawa structures, point-count reduction and analytic gluing are not the missing objects.
- Checked all 59 duplication references against the complete referenced stage descriptions. Preserved the distinction between a common prerequisite/consumer interface and a second proof owner. The upstream EllipticCurves contract contradicts one note (finding 1); the other 58 are consistent when read with their stated import/specialization limitations. Checked the R01.3 comparison in both the campaign and upstream documents directly.
- Checked the integrated library-coverage entries for all 47 layers: job, verdict, target text/status/note and duplicate entries match the accepted audit (the integration omits the per-target declarations array). Inventoried the five partial decompositions and checked their arithmetic ownership caveats as context; they are plans, not evidence of library implementations. No reserved node IDs under these five roadmap prefixes. This job does not re-red-team all source-paper proofs or the whole area graph.

| Roadmap | Layers | Targets | Partial targets | Duplication references |
| --- | ---: | ---: | ---: | ---: |
| ArithmeticGaloisRepresentations | 7 | 36 | 8 | 14 |
| AutomorphicGaloisRepresentations | 6 | 21 | 0 | 15 |
| AutomorphicGaloisRepresentationsPartII | 10 | 37 | 0 | 10 |
| ClassicalSerreModularity | 18 | 49 | 1 | 13 |
| CompletedCohomologyAndLocalGlobalCompatibility | 6 | 17 | 0 | 7 |

The process layers are AG2.1 (aggregate), R26.1 (statement/source assignment) and R31.6 (exports/dependency audit). A process classification is not a claim that its stated mathematical imports have been formalized. The historical review has inconsistent distinct-citation counts; the current file has 98 occurrences and 76 distinct (library, name) pairs. This count difference does not affect a target verdict.

## Finding RT-AUDIT-31/1 — medium: conductor comparison assigned to an owner that excludes it

The duplication note incorrectly assigns the identification of the algorithmic Ogg exponent with the ramification-theoretic conductor to upstream EllipticCurves Layer 4. That owner explicitly excludes this comparison. Tate's algorithm and its algorithmic exponent are valid shared inputs, but they do not discharge R01.3's elliptic conductor comparison, especially its wild cases at 2 and 3. The error is limited to the ownership note: the comparison target is already correctly marked absent and the layer correctly remains not built.

Read at explorer commit f52ac6c69e8439cf27a5356b7554c67f3046499a on 2026-09-24: https://github.com/CBirkbeck/tauceti-explorer/blob/f52ac6c69e8439cf27a5356b7554c67f3046499a/research/blueprint/audit/AUDIT-31.result.json#L466-L470 says the upstream layer owns the algorithmic exponent 'and its identification with the ramification-theoretic conductor'. In contrast, https://github.com/CBirkbeck/tauceti-explorer/blob/f52ac6c69e8439cf27a5356b7554c67f3046499a/content/tau-ceti/EllipticCurves/README.md#L821-L835 first distinguishes the algorithmic exponent from the conductor and then calls the identification a 'separate, related project', 'cited (Saito) for context only'. This is an explicit exclusion, not silence about a prerequisite. https://github.com/CBirkbeck/tauceti-explorer/blob/f52ac6c69e8439cf27a5356b7554c67f3046499a/content/campaign/ArithmeticGaloisRepresentations/README.md#L44-L50 explicitly requires the precise elliptic conductor comparison without omitting wild contributions at 2 and 3. The same incorrect duplicate note is present in the integrated data/library-coverage.json at this snapshot.

Narrow the R01.3 duplicate note for upstream EllipticCurves Layer 4 to its actual equation-level outputs: reduction, Tate's algorithm and its algorithmic exponent, and Neron-Ogg-Shafarevich. Explicitly say that identification with the ramification-theoretic conductor is excluded upstream and remains an R01.3 obligation using the required geometric inputs. Suggested replacement: 'Supplies equation-level reduction, Tate's algorithm, the algorithmic exponent v(Delta) - m + 1, and Neron-Ogg-Shafarevich. It explicitly excludes identification of that exponent with the ramification-theoretic conductor; R01.3 must retain the elliptic comparison, including wild contributions at 2 and 3.' Keep the target's absent classification and the layer's not-built verdict. Have the normal audit integration refresh the corresponding coverage entry; do not remove this comparison from planning as an already-owned upstream proof.

The narrow correction is intentional. Upstream Tate algorithm outputs and Neron–Ogg–Shafarevich remain valid suppliers. A zero-conductor/good-reduction criterion does not establish the full conductor exponent. NeronModelsAndSemistableAbelianVarieties R11.5 also imports R01 conductors; its existence is not evidence that upstream EllipticCurves already owns this identification.

## Statement-level checks

### C01–C09

ContRepresentation and TopRep bundle continuous operators; this does not by itself require continuity as the group element varies. Exterior/symmetric powers, invariant forms, H1, conjugation on Hom and polynomial laws are genuine algebraic ingredients. They do not give finite-projective framing, topological tensor induction, Galois polarization/oddness, adequacy, ad^0 with the p-divides-n correction, or multiplicative homogeneous determinant reconstruction.

### C10–C16

galoisLatticeProperty is finite free over Z with open stabilizers, not the compactness construction of a p-adic stable lattice. An open subgroup gives a finite Galois quotient; Module.Finite in isOpen_ker_of_finite means finite generation. The separable action-field representation is for that integral lattice category. Character recognition is for finite groups in characteristic zero; multiplicity and Grothendieck-group statements do not provide residual Brauer-Nesbitt or an arithmetic semisimplification.

### C17–C21

Restriction and coinduction exist for continuous operators/functions; linHom has its normed-field setting. Base change and dual are algebraic. The audit already records the missing topology and therefore these ingredients do not supply every continuous operation required by the composite target.

### C22–C29

The absolute-Galois map uses a chosen separable-closure embedding. Valuation decomposition/inertia subgroups do not require a finite Galois extension; the accepted correction is right. Frobenius generating a stabilizer has its number-field/unramified hypotheses. Teichmuller lifts and the cyclotomic character do not construct tame fundamental characters. Jordan-Chevalley for an endomorphism, or for Hopf-algebra points, is not the Weil-Deligne functor.

### C30–C38

Place.ramificationGroup uses a Place k F; Place includes triviality on the constant field, excluding the intended mixed-characteristic p-adic valuation. Dirichlet conductors and reduction predicates do not give Artin/Swan conductors. GL2 conjugacy representatives are not the classification of finite subgroups of GL2/PGL2. The abstract dihedral group and ordinary IsIrreducible do not prove the odd residual absolute-irreducibility criterion.

### C39–C42

Frobenius prime sets and their union theorem describe the partition outside ramification, not density. Galois descent spans a semilinear representation by invariants; Frobenius-Schur treats real realizability of the stated compact/unitary complex representations. Neither supplies the requested arbitrary coefficient-field obstruction and arithmetic recognition.

### C43–C50

Finite torsion cardinality, multiplication on an abelian variety, pointwise base change, isogenies, point-count trace and degree(1-Frobenius) are genuine inputs. There is no inverse-limit Tate module with its rank/continuity, Weil pairing, inertia comparison or determinant theorem in these statements. The existing local polynomial and Euler factor are defined using reduction and point counts; the audit correctly calls the comparison interface only partial.

### C51–C62

The newform, multiplicity-one and Hecke-action statements concern complex analytic forms. The good-prime coefficient recursion is not the Eichler-Shimura cohomological relation. Totally real/CM fields, quaternions, arithmetic Frobenius and GL2 Hecke polynomial presentations are foundations, not Hilbert/GLn automorphic Galois systems. The cusp-form big-O bound is weaker than purity/Ramanujan-Petersson. BDeRham is a ring construction, not a Galois-representation admissibility or comparison theorem.

### C63–C66

EllAdicCohomology defines untwisted pro-etale Z_l cohomology, not the local-system Shimura realization with Galois and Hecke actions. Weyl modules over Q-algebras do not build geometric correspondences. Spa provides the valuation-spectrum set/topology, not dagger log-de-Rham cohomology. Partition dominance is not a local Langlands nilpotent-orbit comparison.

### C67–C72

Bertrand, explicit theta/psi estimates and primes in arithmetic progressions are useful partial arithmetic inputs; they do not give all auxiliary-prime inequalities and finite checks in the stated induction. AbelianVariety.dim does not prove Fontaine/Schoof exclusions. Strong multiplicity one for newforms at fixed level, weight and character does not prove Serre modularity or its weight/level optimization.

### C73–C76

Gamma1 is a congruence subgroup. continuousCohomology is continuous group cohomology, not the completed cohomology of a modular tower. Amice is a measure/power-series equivalence over Z_p, not the completed group algebra of a general compact p-adic analytic group. IsProP is a topological-group predicate, not the finite-generation, projectivity or local-global theorem.

## Search coverage by layer

All target texts, notes, citations and duplicate notes were read. The following matrix accounts for every layer; numbers point to the search families below. Each family was run over the declaration index before both complete Lean source trees. Generic-word hits were screened by namespace, file context and, for relevant near matches, the actual statement. We did not read every proof in every file hit by a generic word such as `patch` or `polarization`.

| Layer | Targets | Citation occurrences | Duplication references | Search families | Verdict |
| --- | ---: | ---: | ---: | --- | --- |
| ArithmeticGaloisRepresentations:G7 | 7 | 8 | 2 | 01, 02, 03, 12 | not built |
| ArithmeticGaloisRepresentations:R01.1 | 6 | 15 | 1 | 01, 02, 07 | not built |
| ArithmeticGaloisRepresentations:R01.2 | 5 | 8 | 2 | 04, 05 | not built |
| ArithmeticGaloisRepresentations:R01.3 | 5 | 5 | 3 | 05, 08 | not built |
| ArithmeticGaloisRepresentations:R01.4 | 3 | 4 | 0 | 03, 06 | not built |
| ArithmeticGaloisRepresentations:R01.5 | 3 | 6 | 3 | 07, 12 | not built |
| ArithmeticGaloisRepresentations:R01.6 | 7 | 9 | 3 | 05, 08 | not built |
| AutomorphicGaloisRepresentations:R19.1 | 5 | 4 | 4 | 08, 09, 13, 14 | not built |
| AutomorphicGaloisRepresentations:R19.2 | 3 | 2 | 1 | 09, 13, 14 | not built |
| AutomorphicGaloisRepresentations:R19.3 | 3 | 1 | 3 | 10, 11 | not built |
| AutomorphicGaloisRepresentations:R19.4 | 3 | 1 | 1 | 05, 10, 17 | not built |
| AutomorphicGaloisRepresentations:R19.5 | 3 | 1 | 2 | 11 | not built |
| AutomorphicGaloisRepresentations:R19.6 | 4 | 2 | 4 | 08, 12 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.0 | 5 | 5 | 2 | 03, 13, 17 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.1 | 1 | 0 | 0 | 09, 14 | process |
| AutomorphicGaloisRepresentationsPartII:AG2.1a | 4 | 2 | 0 | 09, 14 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.1b | 3 | 0 | 1 | 10, 14 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.2 | 4 | 0 | 1 | 03, 13, 14, 17 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.3 | 3 | 0 | 0 | 07, 12, 15 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.4 | 4 | 1 | 1 | 12, 14, 15, 16 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.5 | 5 | 2 | 1 | 04, 14, 17 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.6 | 4 | 1 | 2 | 03, 10, 11 | not built |
| AutomorphicGaloisRepresentationsPartII:AG2.7 | 4 | 1 | 2 | 01, 03, 07, 12 | not built |
| ClassicalSerreModularity:R26.1 | 2 | 1 | 2 | 18 | process |
| ClassicalSerreModularity:R26.2 | 3 | 0 | 2 | 06, 10, 11, 18 | not built |
| ClassicalSerreModularity:R26.3 | 3 | 3 | 0 | 18, 19 | not built |
| ClassicalSerreModularity:R26.4 | 3 | 0 | 0 | 06, 18 | not built |
| ClassicalSerreModularity:R26.5 | 3 | 1 | 1 | 18, 20 | not built |
| ClassicalSerreModularity:R26.6 | 3 | 1 | 0 | 18 | not built |
| ClassicalSerreModularity:R27.1 | 3 | 2 | 0 | 06, 07, 18, 19 | not built |
| ClassicalSerreModularity:R27.2 | 3 | 1 | 0 | 10, 11, 18, 19 | not built |
| ClassicalSerreModularity:R27.3 | 3 | 0 | 0 | 10, 18 | not built |
| ClassicalSerreModularity:R27.4 | 3 | 0 | 0 | 06, 18 | not built |
| ClassicalSerreModularity:R27.5 | 2 | 0 | 1 | 11, 18 | not built |
| ClassicalSerreModularity:R27.6 | 3 | 2 | 1 | 09, 18 | not built |
| ClassicalSerreModularity:R33.1 | 3 | 0 | 0 | 10, 11, 18 | not built |
| ClassicalSerreModularity:R33.2 | 3 | 1 | 0 | 05, 06, 07, 18, 19 | not built |
| ClassicalSerreModularity:R33.3 | 2 | 0 | 1 | 11, 18 | not built |
| ClassicalSerreModularity:R33.4 | 2 | 1 | 2 | 11, 18, 20 | not built |
| ClassicalSerreModularity:R33.5 | 3 | 0 | 2 | 11, 18, 21 | not built |
| ClassicalSerreModularity:R33.6 | 2 | 1 | 1 | 18, 21 | not built |
| CompletedCohomologyAndLocalGlobalCompatibility:R31.1 | 3 | 4 | 2 | 09, 21 | not built |
| CompletedCohomologyAndLocalGlobalCompatibility:R31.2 | 2 | 1 | 1 | 09, 21 | not built |
| CompletedCohomologyAndLocalGlobalCompatibility:R31.3 | 3 | 1 | 1 | 12, 21, 22 | not built |
| CompletedCohomologyAndLocalGlobalCompatibility:R31.4 | 3 | 0 | 0 | 21 | not built |
| CompletedCohomologyAndLocalGlobalCompatibility:R31.5 | 3 | 0 | 2 | 21, 22 | not built |
| CompletedCohomologyAndLocalGlobalCompatibility:R31.6 | 3 | 0 | 1 | 18, 21, 22 | process |

### Search expressions

`rg -n -i` was used for each expression; the source-tree pass additionally used `--glob '*.lean'`. Match counts below are lines, not declaration counts; comments and namesakes are included. The source copies used for cited evidence were checked against the exact pinned raw files.

| Family | Expression | Index lines | Source lines |
| --- | --- | ---: | ---: |
| 01-continuity-lattices | `galoisLattice&#124;stable.?lattice&#124;invariant.?lattice&#124;lattice.*(invariant&#124;stable)&#124;[Cc]ontinuous.*[Rr]epresentation&#124;[Cc]ontinuous.*[Aa]ction&#124;finite.*[Cc]oefficient` | 545 | 819 |
| 02-powers-adjoint | `tensor.?[Ii]nduc&#124;restrict[Ss]calars&#124;adjoint[Rr]ep&#124;trace.?zero&#124;traceless&#124;quotient.*[Ss]calar` | 546 | 3672 |
| 03-polarization-image | `polariz&#124;polarisa&#124;adequac&#124;adequate&#124;enormous&#124;decomposed.?generic&#124;residual.*generic&#124;[Ii]sOdd.*[Rr]ep&#124;[Oo]dd.*[Rr]epresentation` | 573 | 1218 |
| 04-local-monodromy | `[Ww]eil.?[Dd]eligne&#124;[Ww]eil.?[Gg]roup&#124;quasi.?unipot&#124;fundamental.?[Cc]haracter&#124;tame.?[Cc]haracter&#124;[Mm]onodromy` | 182 | 1088 |
| 05-conductors | `[Aa]rtin.?[Cc]onductor&#124;[Ss]wan&#124;[Cc]onductor&#124;[Hh]asse.?[Aa]rf&#124;[Hh]erbrand&#124;upper.?[Nn]umber&#124;ramificationGroup&#124;[Tt]ate.?[Aa]lgorithm&#124;\bOgg\b` | 86 | 401 |
| 06-residual-image | `[Dd]ickson&#124;bad.?[Dd]ihedral&#124;good.?[Dd]ihedral&#124;absolutely.?[Ii]rreduc&#124;absolute.?[Ii]rreduc&#124;[Pp]rojective.?[Ii]mage` | 29 | 98 |
| 07-recognition | `[Bb]rauer.?[Nn]esbitt&#124;[Ss]emisimplification&#124;[Ss]chur.?[Ii]ndex&#124;[Bb]rauer.?[Cc]lass&#124;[Cc]hebotarev&#124;[Cc]ebotarev&#124;[Ff]robenius.*[Dd]ens` | 83 | 212 |
| 08-tate-pairing | `[Tt]ate.?[Mm]odule&#124;[Ww]eil.?[Pp]airing&#124;[Hh]asse.?[Bb]ound&#124;[Ff]robenius.?[Cc]haracteristic&#124;[Tt]orsion.*[Gg]alois` | 1 | 41 |
| 09-automorphic-construction | `[Gg]alois.*[Rr]epresentation&#124;[Hh]ilbert.?[Mm]odular&#124;[Kk]uga.?[Ss]ato&#124;[Ee]ichler.?[Ss]himura&#124;[Dd]eligne.?[Ss]erre&#124;[Aa]rtin.?[Rr]epresentation&#124;[Ss]himura.?[Cc]urve&#124;[Mm]odular.?[Aa]belian` | 65 | 45 |
| 10-purity-systems | `[Rr]amanujan.?[Pp]etersson&#124;[Cc]ompatible.?[Ss]ystem&#124;[Ww]eil.?[Pp]urity&#124;[Ww]eight.?[Mm]onodromy&#124;[Pp]ure.*[Gg]alois&#124;[Ss]teinberg&#124;[Ww]eights.*[Cc]ohomology` | 165 | 1076 |
| 11-padic-hodge | `[Hh]odge.?[Tt]ate&#124;BDeRham&#124;[Dd]e.?[Rr]ham.*[Rr]epresentation&#124;[Cc]rystalline&#124;[Ss]emistable.*[Rr]epresentation&#124;[Bb]arsotti&#124;[Ff]ontaine&#124;\bWach\b&#124;D_cris&#124;[Ii]nertial.?[Tt]ype` | 63 | 85 |
| 12-hecke-determinants | `[Pp]olynomial[Ll]aw&#124;[Pp]seudo.?[Rr]epresentation&#124;[Pp]seudo.?[Cc]haracter&#124;[Gg]alois.*[Dd]eterminant&#124;[Dd]eterminant.*[Ll]aw&#124;[Dd]eformation.?[Rr]ing&#124;[Hh]ecke.*[Cc]omplet` | 53 | 38 |
| 13-algebraicity-satake | `[Ss]atake&#124;[Hh]ecke.?[Cc]haracter&#124;[Aa]utomorphic.?[Rr]epresentation&#124;[Hh]ecke.*[Ii]ntegral&#124;[Ii]ntegral.*[Ee]igenvalue&#124;[Aa]lgebraic.*[Ee]igenvalue&#124;[Rr]ationality.*[Ff]ield` | 132 | 33 |
| 14-geometric-traces | `[Ss]himura&#124;[Ii]gusa&#124;nearby.?[Cc]ycle&#124;[Ff]ujiwara&#124;[Ee]ndoscop&#124;[Bb]ase.?[Cc]hange.*[Aa]utomorphic&#124;\bShin\b&#124;[Tt]race.?[Ff]ormula` | 0 | 270 |
| 15-eigenvariety | `[Ee]igenvariet&#124;[Ff]redholm&#124;[Ss]lope.?[Dd]ecomposition&#124;[Cc]lassicality&#124;[Aa]ffinoid&#124;[Ww]eight.?[Ss]pace&#124;[Cc]henevier&#124;\bHarris\b` | 654 | 3493 |
| 16-rigid-overconvergent | `[Oo]verconvergent&#124;[Dd]agger&#124;[Rr]igid.?[Cc]ohomology&#124;[Ll]ogarithmic.*[Dd]e.?[Rr]ham&#124;[Cc]ompact.?[Ss]upport.*[Dd]e.?[Rr]ham` | 0 | 1 |
| 17-local-langlands | `[Ll]anglands&#124;[Ww]eil.?[Dd]eligne&#124;[Nn]ilpotent.?[Oo]rbit&#124;[Mm]onodromy.*[Tt]ype&#124;\bVarma\b&#124;[Cc]araiani&#124;[Tt]aylor.?[Yy]oshida` | 20 | 10 |
| 18-serre-induction | `[Ss]erre.?[Mm]odular&#124;[Ss]erre.?[Ww]eight&#124;[Kk]hare&#124;[Ww]int[e]?nberger&#124;[Bb]ockle&#124;[Bb]öckle&#124;[Ww]eight.?[Rr]eduction&#124;[Ww]eight.?[Cc]ycl&#124;[Cc]hange.*[Pp]rime&#124;[Kk]isin&#124;\bBuzzard\b&#124;[Ww]iese&#124;[Ss]kinner&#124;[Tt]unnell&#124;[Rr]ohrlich&#124;[Dd]ieulefait&#124;\bPacetti\b&#124;[Pp]romodular` | 5 | 652 |
| 19-prime-estimates | `[Rr]osser&#124;[Ss]choenfeld&#124;[Ss]choenfield&#124;[Bb]ertrand&#124;[Cc]hebyshev&#124;prime.*(interval&#124;progression)&#124;prime.*(lt&#124;le).*mul` | 1079 | 1317 |
| 20-arithmetic-basecases | `[Ss]choof&#124;[Ss]nowden&#124;[Oo]dlyzko&#124;[Gg][Ll]2.?[Tt]ype&#124;[Ss]emistable.*[Aa]belian&#124;[Ff]ontaine.*[Aa]belian&#124;[Gg]ood.?[Rr]eduction` | 9 | 26 |
| 21-completed-cohomology | `[Cc]ompleted.?[Cc]ohomology&#124;[Ii]wasawa&#124;[Ll]ocally.?[Aa]lgebraic&#124;[Ll]ocally.?[Aa]nalytic&#124;[Hh]ochschild.?[Ss]erre&#124;[Ee]merton&#124;[Pp]ask&#124;[Pp]ašk&#124;[Hh]u.?[Tt]an&#124;\bTung\b&#124;[Pp]adic.?[Aa]nalytic` | 11 | 60 |
| 22-patching | `[Pp]atch&#124;[Tt]aylor.?[Ww]iles&#124;[Pp]seudo.?[Dd]eformation&#124;[Gg]lobalisation&#124;[Gg]lobalization&#124;[Dd]eformation.*[Rr]epresentation` | 42 | 221 |

### Close search results

- `TauCeti.RepresentationTheory.Symmetric.Specht.AbsoluteIrreducibility` really proves scalar endomorphisms for rational Specht modules. It is useful special-case representation theory; it is not the odd rank-two residual Galois theorem of R01.4. `Representation.finrank_intertwiningMap_baseChange` preserves an intertwiner dimension for a finite group and finite-dimensional source. It does not construct the general residual semisimplification or the descent obstruction.
- `NumberField.exists_auxiliaryPrime` (TauCeti/NumberTheory/Chebotarev/AuxiliaryPrime.lean:45) produces a large rational prime congruent to 1, unramified in two number fields, with an irreducible cyclotomic polynomial over the base. It does not prescribe a Frobenius conjugacy class or the good-dihedral local representation required by R27.1/R33.2. Chebotarev density/recognition remains missing.
- Brauer-group constructors, matrix equivalence and tensor products are present; they do not attach and annul the coefficient-descent obstruction of the specified representation. The audit need not treat general Brauer algebra as absent.
- Fredholm operators and their index theory are present; some elementary lemmas hold over general nontrivially normed fields. Neither this nor the real/complex Riesz theory constructs the Fredholm determinants and slope/eigenvariety package requested here.
- Other namesakes include topological/quiver monodromy, Dickson polynomials, Tate Hodge structures, finite-group Steinberg representations, the finite permutation-group Iwasawa method and analytic/topological patching. The relevant arithmetic objects do not follow from those hits.
- Weil-pairing divisor preparation and elliptic torsion-cardinality results do not build the pairing or its Galois determinant identity. Divided-power algebra and Fontaine theta/BDeRham foundations do not supply crystalline comparison. Locally analytic phrases in ordinary analysis and the Hochschild–Serre TODO in group cohomology do not implement completed tower cohomology.

The five supplemental Tau Ceti files for Specht, Place, Fredholm, auxiliary primes and Brauer-group context were also fetched at f790474821cf4256814db967cb154e7af3d0c369 and matched byte for byte. The absence assessments concern the actual composite targets, not an assertion that every useful constituent is missing.

## Citation register

Every statement below was read with its namespace and typeclass context. Repeated occurrences in the audit were compared with each target they support. The IDs are local to this report.

| ID | Declaration | Pinned statement |
| --- | --- | --- |
| C01 | `ContRepresentation` | [Mathlib/RepresentationTheory/Continuous/Basic.lean:54](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L54) |
| C02 | `Representation.exteriorPower` | [TauCeti/RepresentationTheory/ExteriorPower.lean:50](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ExteriorPower.lean#L50) |
| C03 | `Representation.symmetricPower` | [TauCeti/RepresentationTheory/SymmetricPower.lean:47](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/SymmetricPower.lean#L47) |
| C04 | `NumberField.IsCMField.complexConj` | [Mathlib/NumberTheory/NumberField/CMField.lean:143](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CMField.lean#L143) |
| C05 | `TauCeti.Representation.IsInvariantForm` | [TauCeti/RepresentationTheory/InvariantForm.lean:149](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/InvariantForm.lean#L149) |
| C06 | `groupCohomology.H1` | [Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:961](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean#L961) |
| C07 | `Representation.linHom` | [Mathlib/RepresentationTheory/Basic.lean:656](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L656) |
| C08 | `PolynomialLaw` | [Mathlib/RingTheory/PolynomialLaw/Basic.lean:77](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PolynomialLaw/Basic.lean#L77) |
| C09 | `TopRep` | [Mathlib/RepresentationTheory/Continuous/TopRep.lean:31](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/TopRep.lean#L31) |
| C10 | `TauCeti.galoisLatticeProperty` | [TauCeti/RepresentationTheory/GaloisLattice/Basic.lean:39](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisLattice/Basic.lean#L39) |
| C11 | `Field.absoluteGaloisGroup.finite_quotient_of_isOpen` | [TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean:108](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean#L108) |
| C12 | `Representation.isOpen_ker_of_finite` | [TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean:55](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisLattice/FiniteQuotient.lean#L55) |
| C13 | `TauCeti.GaloisLatticeCat.separableActionFieldRepresentation` | [TauCeti/RepresentationTheory/GaloisLattice/SeparableActionField.lean:134](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisLattice/SeparableActionField.lean#L134) |
| C14 | `Representation.nonempty_equiv_of_character_eq` | [TauCeti/RepresentationTheory/CharacterTable/Determined.lean:72](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/Determined.lean#L72) |
| C15 | `TauCeti.nonempty_linearEquiv_of_finrank_linearMap_eq` | [TauCeti/RingTheory/Semisimple/Multiplicity.lean:286](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Semisimple/Multiplicity.lean#L286) |
| C16 | `TauCeti.simpleClassBasis` | [TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean:268](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GrothendieckGroup/SimpleBasis.lean#L268) |
| C17 | `ContRepresentation.restrict` | [Mathlib/RepresentationTheory/Continuous/Basic.lean:435](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L435) |
| C18 | `ContRepresentation.coind` | [Mathlib/RepresentationTheory/Continuous/Basic.lean:547](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L547) |
| C19 | `ContRepresentation.linHom` | [TauCeti/RepresentationTheory/Continuous/LinHom.lean:85](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Continuous/LinHom.lean#L85) |
| C20 | `Representation.baseChange` | [TauCeti/RepresentationTheory/BaseChange.lean:67](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/BaseChange.lean#L67) |
| C21 | `Representation.dual` | [Mathlib/RepresentationTheory/Basic.lean:671](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean#L671) |
| C22 | `Field.absoluteGaloisGroup.map` | [Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:88](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/AbsoluteGaloisGroup.lean#L88) |
| C23 | `ValuationSubring.decompositionSubgroup` | [Mathlib/RingTheory/Valuation/RamificationGroup.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/RamificationGroup.lean#L30) |
| C24 | `Ideal.inertia` | [Mathlib/RingTheory/Ideal/Defs.lean:154](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Defs.lean#L154) |
| C25 | `Ideal.zpowers_eq_stabilizer_of_isArithFrobAt` | [TauCeti/NumberTheory/NumberField/Frobenius/DecompositionGroup.lean:203](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/Frobenius/DecompositionGroup.lean#L203) |
| C26 | `TauCeti.teichmuller` | [TauCeti/NumberTheory/LocalField/Teichmuller.lean:100](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean#L100) |
| C27 | `cyclotomicCharacter` | [Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean#L307) |
| C28 | `Module.End.exists_isNilpotent_isSemisimple` | [Mathlib/LinearAlgebra/JordanChevalley.lean:76](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/JordanChevalley.lean#L76) |
| C29 | `TauCeti.HopfAlgebra.Point.semisimplePart` | [TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.lean:70](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/Representation/JordanDecomposition/Basic.lean#L70) |
| C30 | `TauCeti.Place.ramificationGroup` | [TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.lean:109](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/Extension/RamificationGroup.lean#L109) |
| C31 | `ValuationSubring.inertiaSubgroup` | [Mathlib/RingTheory/Valuation/RamificationGroup.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/RamificationGroup.lean#L50) |
| C32 | `DirichletCharacter.conductor` | [Mathlib/NumberTheory/DirichletCharacter/Basic.lean:246](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/DirichletCharacter/Basic.lean#L246) |
| C33 | `WeierstrassCurve.HasMultiplicativeReduction` | [Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:347](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean#L347) |
| C34 | `WeierstrassCurve.HasAdditiveReduction` | [Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:354](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean#L354) |
| C35 | `TauCeti.GL2NonSplitTorus` | [TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/NonSplitTorus.lean:127](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/NonSplitTorus.lean#L127) |
| C36 | `TauCeti.conjRepGLFinTwo` | [TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean:269](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/ConjugacyClasses.lean#L269) |
| C37 | `DihedralGroup` | [Mathlib/GroupTheory/SpecificGroups/Dihedral.lean:33](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean#L33) |
| C38 | `Representation.IsIrreducible` | [Mathlib/RepresentationTheory/Irreducible.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Irreducible.lean#L30) |
| C39 | `NumberField.Chebotarev.frobeniusPrimeSet` | [TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean#L93) |
| C40 | `TauCeti.GaloisDescent.span_invariants_eq_top` | [TauCeti/RepresentationTheory/GaloisDescent/Span.lean:38](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/GaloisDescent/Span.lean#L38) |
| C41 | `ContRepresentation.frobeniusSchurIndicator_eq_one_iff_isRealizableOverReal` | [TauCeti/RepresentationTheory/Compact/FrobeniusSchur/StructureMap.lean:145](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/FrobeniusSchur/StructureMap.lean#L145) |
| C42 | `NumberField.Chebotarev.iUnion_frobeniusPrimeSet` | [TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:242](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean#L242) |
| C43 | `TauCeti.Isogeny.card_ker_mulByIntIsogeny` | [TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/KernelCard.lean:117](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/KernelCard.lean#L117) |
| C44 | `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` | [TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:243](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean#L243) |
| C45 | `WeierstrassCurve.Affine.Point.map` | [Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:824](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean#L824) |
| C46 | `WeierstrassCurve.frobeniusTrace` | [TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:97](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean#L97) |
| C47 | `TauCeti.Isogeny.degree_oneSubFrobeniusIsogeny_eq_pointCount` | [TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/OneSubFrobenius/Degree.lean:96](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/OneSubFrobenius/Degree.lean#L96) |
| C48 | `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | [TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:61](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean#L61) |
| C49 | `WeierstrassCurve.localPolynomial` | [Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean#L43) |
| C50 | `WeierstrassCurve.localEulerFactor` | [Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean#L57) |
| C51 | `HeckeRing.GL2.Newform` | [TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:102](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean#L102) |
| C52 | `HeckeRing.GL2.finrank_cuspFormsNewEigenspace_eq_one` | [TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.lean:188](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.lean#L188) |
| C53 | `HeckeRing.GL2.heckeRingHomCuspCharSpace` | [TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean:393](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean#L393) |
| C54 | `HeckeRing.GL2.Newform.qExpansion_coeff_eq_eigenvalue` | [TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean:95](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean#L95) |
| C55 | `NumberField.IsTotallyReal` | [Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean#L47) |
| C56 | `QuaternionAlgebra.normForm` | [TauCeti/Algebra/Quaternion/NormForm.lean:72](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Quaternion/NormForm.lean#L72) |
| C57 | `CuspFormClass.qExpansion_isBigO` | [Mathlib/NumberTheory/ModularForms/Bounds.lean:315](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Bounds.lean#L315) |
| C58 | `HeckeRing.GL2.Newform.qExpansion_coeff_prime_pow_add_two` | [TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean:114](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/Coefficient.lean#L114) |
| C59 | `BDeRham` | [Mathlib/RingTheory/Perfectoid/BDeRham.lean:90](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean#L90) |
| C60 | `NumberField.IsCMField` | [Mathlib/NumberTheory/NumberField/CMField.lean:71](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/CMField.lean#L71) |
| C61 | `HeckeRing.GLn.polynomialRingEquivTwo` | [TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Injective.lean:684](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Injective.lean#L684) |
| C62 | `AlgHom.IsArithFrobAt` | [Mathlib/RingTheory/Frobenius.lean:54](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Frobenius.lean#L54) |
| C63 | `AlgebraicGeometry.Scheme.EllAdicCohomology` | [Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean#L75) |
| C64 | `TauCeti.weylModuleOfShape` | [TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean:417](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/WeylModule.lean#L417) |
| C65 | `TauCeti.ValuationSpectrum.spa` | [TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:97](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean#L97) |
| C66 | `TauCeti.DominanceOrder.partitionPartialOrder` | [TauCeti/Combinatorics/Enumerative/Partition/Dominance.lean:196](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Combinatorics/Enumerative/Partition/Dominance.lean#L196) |
| C67 | `Nat.exists_prime_lt_and_le_two_mul` | [Mathlib/NumberTheory/Bertrand.lean:222](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Bertrand.lean#L222) |
| C68 | `Chebyshev.theta_ge` | [Mathlib/NumberTheory/Chebyshev.lean:498](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Chebyshev.lean#L498) |
| C69 | `Chebyshev.psi_le_const_mul_self` | [Mathlib/NumberTheory/Chebyshev.lean:456](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Chebyshev.lean#L456) |
| C70 | `TauCeti.AlgebraicGeometry.AbelianVariety.dim` | [TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:117](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean#L117) |
| C71 | `Nat.forall_exists_prime_gt_and_eq_mod` | [Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/LSeries/PrimesInAP.lean#L442) |
| C72 | `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` | [TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:87](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean#L87) |
| C73 | `CongruenceSubgroup.Gamma1` | [Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:131](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean#L131) |
| C74 | `continuousCohomology` | [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131) |
| C75 | `AbstractMeasure.amiceTransformEquiv` | [Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:156](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean#L156) |
| C76 | `TauCeti.IsProP` | [TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean:53](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean#L53) |

## Validation and limits

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-31.result.json` — passed; zero errors.
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-AUDIT-31.result.json research/blueprint/redteam/RT-AUDIT-31.md` — passed; two files, zero problems.
- Inventory and citation controls: 47/47 stages, 160 targets, 98 index matches, 76 distinct statements, 65 pinned file matches, 59 owner references; integrated target/status/note/duplicate data agrees.
- Only the two issue deliverables are changed. No Lean file was requested, edited or compiled. This is a library audit red team, not a new proof or a complete re-extraction of the cited mathematical literature.
