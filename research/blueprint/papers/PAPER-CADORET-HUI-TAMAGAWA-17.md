# PAPER-CADORET-HUI-TAMAGAWA-17: independent review and revised extraction

The independent review is **complete, verdict revise**. The extraction is **partial**. Codex `codex-hjdg0j` reviewed the work completed by Claude Code `cc-442dc5`, including its earlier Codex continuations. This session did not write the input. All 156 item IDs are preserved: 12 library, 24 planned and 120 missing; 45 definitions/constructions have 97 API entries and 135 planning tests.

The [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p05-p.pdf) proves geometric semisimplicity for all sufficiently large primes, uniform invariant reduction for bounded Schur constructions and arithmetic-stable subquotients, and almost-hyperspecial geometric images after one finite étale cover independent of the prime. Its final arithmetic semisimplicity/Tate-fullness corollary remains conditional. “Almost hyperspecial” refers to the full inverse image under the simply connected cover. Geometric purity must not be substituted for arithmetic semisimplicity.

This review read all published pp.205–236, all of [Larsen2010](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf) pp.1029–1038, [Cadoret–Tamagawa’s author version](https://webusers.imj-prg.fr/~anna.cadoret/TI.pdf) pp.10–12, and [Milne–Ramachandran’s author version](https://math.umd.edu/~atma/mf1-jsmweb.pdf) §3 pp.10–11. Selected passages of [GSS.pdf](https://webusers.imj-prg.fr/~anna.cadoret/GSS.pdf) were compared. The cited recursive originals not listed as read remain open. Source hashes and reading scope are in the JSON.

## Corrections and limits

The input called its extraction complete while G1–G6 and G8 still deferred source, hypothesis and ownership questions. Merely calling those results “suppliers” does not verify that their statements cover the consumer. The review restores partial status and preserves concrete tasks. G9 is downstream Lean work and is not, by itself, an extraction blocker.

Five existing-owner corrections concern the arithmetic fundamental-group sequence (IG.1/NC.0), integral Künneth (EDC.0), hyperspecial models (RG2.3), Tate assertions (MC.7), and relative semisimple groups (upstream ReductiveGroups Layer8). SchurWeyl Layer2 owns the group-algebra projector, whereas ClassicalGroups Layer2 explicitly owns its GL-equivariant image. Routes3 and9 now respect this boundary. The generic coefficient source route contains conditional lattice H¹ surjectivity; the actual affine-curve application48 belongs to the geometric weight route.

The integral projector proof descends the pinned rational identity through Z[S_d]→Q[S_d]. Taking the identity coefficient makes its scalar integral; positivity and nλ·dim(Sλ)=d! show it divides d!. Its normalized idempotent therefore exists over Zℓ and Fℓ for ℓ>d. Direct summands commute with base change. Mixed tensor constructions have contravariant dual factors: arbitrary linear maps require a two-variable bifunctor; a one-variable transport uses isomorphisms. The determinant retraction uses wedge evaluation and never divides by the subspace dimension.

The degree-projector gap is narrowed by an explicit CRT proof. The fixed cohomological Frobenius polynomials have disjoint pure weights; after excluding their finitely many resultants and denominators, polynomial projectors equal the degree projections. Every arithmetic-stable submodule or quotient inherits them. They commute with arithmetic monodromy because they equal those projections, not because Frobenius is central. The remaining G2 task is the uniform assembly with fibre powers, duals, relative dimensions and determinant twists.

Milne–Ramachandran Lemma3.1 has almost-all-prime hypotheses, an invariants-to-coinvariants condition implied by semisimplicity, and a standing smooth-projective hypothesis. The review spells out its discriminant-of-intersection-pairing proof and leaves the extension to CHT’s smooth-proper scope and the recursive pairing inputs open. CHT applies saturation before passing to a finite extension to connect monodromy. No automatic preservation of Tate fullness over arbitrary extensions is needed for that order of argument or claimed here. [Milne’s erratum](https://www.jmilne.org/math/articles/2004a.html) concerns Theorem9.6, not Lemma3.1.

The primary small-prime finding E3 is a proof-scope gap: the root-exponential proof needs a prime bound that parts(9.1.1)–(9.1.2) omit. This is not a counterexample to those assertions. The large-prime geometric application survives this restriction. Correcting the Larsen closed-image misprint E5 likewise does not by itself discharge its reduced-family proof inputs.

## Conventions

- **F:** All schemes finite type. X is connected smooth separated over algebraically closed k, char(k)=p≥0; f:Y→X smooth proper; x geometric. Choose a model f₀:Y₀→X₀ over finitely generated k₀⊂k, with X₀ smooth geometrically connected and separated, and x→X₀. Write π=π₁(X,x), π₀=π₁(X₀,x), Hℓ∞=H*(Yx,Zℓ), Hℓ=H*(Yx,Fℓ), Vℓ∞=Hℓ∞⊗Qℓ, ℓ prime ≠p. Large ℓ means a bound depending on the fixed family and, when specified, fixed tensor degrees, never a bound uniform over all families.
- **C:** Convention F with k₀ finite and X₀ a smooth geometrically connected curve; F is geometric |k₀|-Frobenius at a chosen rational point after a finite constant-field extension. Cohomology of X,Y means geometric base change. H^w is a single cohomological degree; total H* is its finite direct sum.
- **G:** After one finite étale connected cover independent of ℓ, generic geometric Zariski group Gη is connected semisimple, arithmetic generic group G′η connected, residual image Πℓ perfect and generated by its order-ℓ elements for all large ℓ. Π∞ and Π′∞ are geometric and arithmetic lattice images. Write 𝒢 for the flat reduced schematic closure of Gη in GL(Hℓ∞), Gs for its special fibre, and Nℓ for the Nori envelope. These three group schemes are not interchangeable before Theorem 7.3.
- **I:** For a finite-free Zℓ-module M with continuous action of a profinite group Π, InvΠ(M) means M^Π⊗Fℓ→(M⊗Fℓ)^Π is an isomorphism. 'Arithmetic-stable' always means π₀-stable, not merely π-stable. Saturated means that the Zℓ-module cokernel is torsion-free.
- **L:** Gη/Qℓ connected semisimple of dimension δ and rank s, with a faithful r-dimensional algebraic representation V and lattice H. 𝒢 is its reduced schematic closure in GL(H); Gs=𝒢_Fℓ. Nice torus means a maximal torus split over finite E/Qℓ whose closed embedding into GL(V_E) extends as a CLOSED embedding of split Gm^s over O_E into GL(H_OE). Parts 9.1.1–2 are routed only in the sufficiently-large-ℓ scope of their supplied proof, pending E3.

## Route verdicts

### 1. Arithmetic Galois representations, Part II: geometric monodromy and invariant reduction — reject

The geometric endpoint and its two proof branches are faithfully retained, but G1/G2/G3/G6/G7 still leave uniform source and application inputs unclosed. Restoring partial status is necessary.

Items: 01, 02, 03, 05, 11, 12, 13, 14, 18, 24, 25, 26, 29, 30, 31, 36, 49, 61, 62, 63, 64, 65, 66, 81, 92, 93, 94, 95, 99, 102, 103, 105, 106, 107, 108, 109, 110, 111.

Design brief: Import Arithmetic Galois representations (ArithmeticGaloisRepresentations:R01.1,G7), Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.1–2), Scheme and stack foundations (SchemeAndStackFoundations:SF.2), Deligne weights and purity (DeligneWeightsAndPurity:DWP.7–8), and the proposed uniform-integral-weight, integral-Schur and monodromy-model extensions below. For a connected smooth separated X over algebraically closed k and smooth proper f:Y→X, prove Theorem 1.3 separately for bounded mixed Schur tensors, every arithmetic-stable free quotient and every arithmetic-stable saturated submodule, uniformly outside finitely many primes. Prove Theorem 1.1 for geometric π₁ only and, after ONE finite étale cover independent of ℓ, Theorem 1.2's almost-hyperspecial image. Include the finite-field-curve reduction, Gabber/Suh interface, connected/perfect image covers, compatible Frobenius tori, special-fibre=Nori envelope and bounded-index/plus-image comparison. Preserve both proofs: Lie-dual exterior quotients use Theorem 1.3(1), while extension classes use its saturated-submodule part (2). End with Corollary 11.1 conditional on rational semisimplicity and Tate fullness in BOTH w and d−w. Separate geometric determinant triviality from arithmetic twists; resolve mixed-degree and external-input gaps before claiming closure. Suggested file TauCeti/RepresentationTheory/GeometricMonodromy.lean. Give maps, continuity/base-change API, ≥3 tests per definition and theorem dependencies; do not install theorem-shaped axioms. Import the corrected ownership boundaries in routes3 and7–11. An open source gap remains a prerequisite task and cannot be treated as an available theorem.

### 2. Reductive algebraic groups, Part II: Nori envelopes and integral monodromy models — reject

The monodromy-specific direction is justified, but G1/G4/G5 and the generic Hilbert/dimension ownership boundary G8 remain. Existing hyperspecial and relative-group constructions are now imported; correcting E5 does not prove the remaining family/spreading claims.

Items: 04, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 67, 68, 69, 73, 74, 75, 77, 78, 79, 80, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 113, 114, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142.

Design brief: Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), Reductive groups, Part II: local structure and arithmetic models (ReductiveGroupsPartII:RG2.0–3), the pinned field-level semisimple/reductive Hopf predicates, exterior powers, and root data from tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems. Do not reconstruct buildings, parahorics, split Chevalley carriers or general affine Hopf anti-equivalence. Construct Nori envelopes and plus subgroups, truncated exp/log, T≤d with separate s,t bounds, and pointwise tensor stabilizers. Prove Nori and Cadoret–Tamagawa uniformity inputs and Larsen's dimension/bounded-index theorem with its unipotent-radical hypothesis. Prove Lemma 8.1 and Corollary 8.2's group-theoretic interfaces from finite Lie-type nonabelian-factor bounds, smooth reduction, simply connected isogenies and hyperspecial compactness. CFSGStatement supplies candidate carriers, not simplicity or order bounds; prove the required Tits/Steinberg/Lang facts here or locate an actual existing theorem owner before implementation. Construct nice torus models and Δ_H; prove the sufficiently-large-characteristic form of Theorem 9.1 via the big cell and exterior-adjoint Poincaré polynomials. Keep E3's small-prime scope unclaimed. Suggested file TauCeti/AlgebraicGeometry/MonodromyModels.lean. Tests include SL₂, a torus excluded from semisimple conclusions, disconnected/nonsmooth special fibres, and the difference between pointwise and setwise stabilizers. Every definition needs construction API and ≥3 tests. The continuation decomposes the two external bottlenecks into120–142: finite-support tensor multiplicities, finite-type exponential families, scheme-level Chevalley stratification, determinant-line fixing, antisymmetrization and multiplicity elimination; then Nori dimension, positive congruence levels, lift powers, analytic growth, equal first kernels, components, ramified splitting, Hilbert families and finite-field point counts. Import generic Chevalley/character and Plücker foundations from their existing reductive-group/representation owners; these nodes specify the exact uses rather than create competing carriers. The family/spreading step and Larsen Lemma4 corrected-image proof remain gaps, and E5 is confirmed, but the recursive reduced-image inputs remain open. Import the corrected ownership boundaries in routes3 and7–11. An open source gap remains a prerequisite task and cannot be treated as an available theorem. In particular import the relative semisimple predicate117 from upstream ReductiveGroups Layer8 and the hyperspecial construction72 from RG2.3. Generic Hilbert-family/spreading statements must be matched to R09.1 before a final design; do not allocate a second generic parameter-space construction here.

### 3. Representations of the symmetric group, Specht modules, and Schur-Weyl duality, Part II: integral Young symmetrizers — accept

Narrowed to integral Young projectors, the extension has a direct descent proof from the pinned rational identity, explicit normalization and action-convention API. The GL-equivariant image is assigned to its existing ClassicalGroups direction in route9.

Items: 07.

Design brief: Import Representations of the symmetric group, Specht modules, and Schur-Weyl duality (tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl), especially the pinned rational identity in item06. Construct row and signed-column sums over Z, descend c²=nλc through the injective Z→Q map, and prove nλ is a positive divisor of d! by taking the identity coefficient. For rings where nλ is invertible construct its normalized idempotent and prove base-change, relabeling and right/left-action anti-involution identities. Export projectors for Zℓ and Fℓ when ℓ>d, without imposing a Q-algebra instance. The finite-free representation images belong to ClassicalGroupsIntegralSchurFunctors, which imports this result. Suggested file TauCeti/RepresentationTheory/Symmetric/IntegralSymmetrizer.lean. Test d=0, row/column partitions and failure of normalization at a prime dividing nλ. Do not duplicate the rational Specht theory or the GL-equivariant image.

### 4. Deligne weights and purity, Part II: uniform integral and mod-ℓ annihilators — reject

The CRT degree-projector proof is supplied, but Gabber/Suh and the affine-curve coefficient inputs, and the uniform dual/fibre-power assembly, remain G1–G3. The geometric quotient lemma48 now has this owner.

Items: 19, 21, 22, 37, 38, 39, 40, 42, 43, 44, 46, 47, 116, 48.

Design brief: Import Deligne weights and purity (DeligneWeightsAndPurity:DWP.0,7,8), The Weil conjectures (WeilConjectures:WC.3), Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves:EDC.0–2), Adic coefficients and comparisons (AdicCoefficientsAndComparisons:L5), and Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.1). Import IsLocalization.integerNormalization and Polynomial.primPart, then prove the positive-scalar/valuation normalization adapter and nonzero reductions with explicit finite exceptional-prime sets. Prove the Gabber/Suh torsion-free and reduction isomorphisms for all degrees of a fixed smooth proper fibre. Prove Lemma 5.1's torsion characteristic-polynomial divisibility; Lemma 5.2's common Qℓ/Fℓ compact-support annihilator through alteration/localization, retaining compact support as corrected in E1; and Lemma 5.3's high-weight annihilator through Leray and duality. Use resultants to kill H¹ torsion and prove all three parts of Theorem 4.5, including affine-curve quotient surjectivity and the determinant/exterior submodule reduction supplied by the Schur extension. Mixed-degree dévissage and uniformity over the subquotient are explicit proof gates, not consequences of separate pure-degree estimates. Suggested file TauCeti/AlgebraicGeometry/Etale/UniformAnnihilator.lean. Tests cover denominator primes, nonproper A¹, extension F_q→F_q^d, ℓ dividing alteration degree, and the failure of arbitrary mod-ℓ 'weights'. Give ≥3 tests per definition. Import the corrected ownership boundaries in routes3 and7–11. An open source gap remains a prerequisite task and cannot be treated as an available theorem.

### 5. ArithmeticGaloisDuality — accept

R02.1/R02.2 already own the compact-coefficient comparison and descent. The explicit scalar, section, cocycle, rationalization and finite-tower arguments are stated with their topological hypotheses. Lemma155 is conditional on explicit finite-level H² vanishing and H¹ finiteness; geometric lemma48 was removed.

Items: 09, 10, 27, 28, 100, 101, 147, 148, 149, 150, 151, 152, 153, 154, 155.

Supplier stages: ArithmeticGaloisDuality:R02.1, ArithmeticGaloisDuality:R02.2.

### 6. SchemeAndStackFoundations — accept

Narrowed to the lisse-sheaf/stalk equivalence interface15 in SF.2. Import the scheme fundamental group from IG.0 and use the separate arithmetic sequence16; Künneth is removed to EDC.0.

Items: 15.

Supplier stages: SchemeAndStackFoundations:SF.2.

### 7. EtaleDualityAndPerverseSheaves — accept

EDC.0 imports the derived finite/integral Künneth theorem; item33 is its torsion-free smooth-proper specialization with21/22 as explicit inputs. EDC.2 owns the compact-support trace with degree normalization. No new six-functor theory is proposed.

Items: 45, 33.

Supplier stages: EtaleDualityAndPerverseSheaves:EDC.0, EtaleDualityAndPerverseSheaves:EDC.2.

### 8. ReductiveGroupsPartII — reject

The corrected RG2.3 owner is clear, but the exact matched-hyperspecial-point/isogeny extension of72 remains G4 pending the original Tits/Bruhat–Tits proof check. Keep the input routed here without certifying the source contract complete.

Items: 72.

Supplier stages: ReductiveGroupsPartII:RG2.3.

### 9. Finite-dimensional representations of the classical groups, Part II: integral Schur functors and determinant splittings — accept

ClassicalGroups Layer2 explicitly owns the Schur image. This coefficient extension imports the integral projector from route3 and the existing tensor/exterior carriers. The direct-factor and denominator-free determinant retractions now have proofs; geometric determinant triviality is a separate stated input.

Items: 08, 35, 50, 96, 97.

Design brief: Import Representations of the symmetric group, Specht modules, and Schur-Weyl duality (tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl), Classical groups representation theory (tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups), the pinned TauCeti.YoungTableau rational idempotence, and Mathlib exterior/tensor power carriers. Import integral Young projectors from SchurWeylIntegralFunctors (route3); construct finite-free Schur functors on arbitrary lattices, not only values at a standard vector space over a Q-algebra. Prove continuity, equivariant functoriality, tensor/dual/base-change maps, direct summands and symmetric/exterior extreme partitions. Export Lemma 4.4 and the determinant-dual reduction used in §5.3 without losing arithmetic twists. Prove both implications of Lemma 10.1, with the explicit wedge/Hom retraction and the separate zero-rank case; never divide by the subspace dimension. Suggested file TauCeti/RepresentationTheory/ClassicalGroups/IntegralSchur.lean. Treat mixed Schur functors as covariant/contravariant bifunctors, or transport a single-module mixed tensor along isomorphisms. Import continuous-action packaging from ArithmeticGaloisRepresentations:G7. Test trivial/row/column partitions, rank below number of rows, ℓ≤d failure, and a=p in characteristic p for the denominator-free splitting. Include ≥3 tests per definition and all public map laws.

### 10. InverseGaloisAndArithmeticFundamentalGroups — accept

IG.1 explicitly owns the arithmetic fundamental-group sequence. CHT §2.2 supplies a precise Frobenius/global-section use, with rational-point sections imported from NC.0 and no additional left injectivity claimed.

Items: 16.

Supplier stages: InverseGaloisAndArithmeticFundamentalGroups:IG.1.

### 11. MotivesAndAlgebraicCycles — accept

MC.7 explicitly owns coefficient-sensitive Tate statements. The source route contains only the assertions104 and their conditional use, not the still-unclosed saturation theorem107 or an unconditional Tate theorem.

Items: 104.

Supplier stages: MotivesAndAlgebraicCycles:MC.7.

## Source findings

All eight findings have independent confirmed verdicts. E1–E5 were inherited; E6–E8 were added in this review. A scoped correction is not a claim that the main theorem is false.

### E1 — misprint

Published p.218, Lemma 5.2, sentence after the displayed finite étale trace; same omission in author GSS.pdf. Affects: nothing.

Printed: H^w(U′,Λℓ)

Correction: Replace this direct-summand target by H_c^w(U′,Λℓ).

Check: Independently checked published p.218 and the author trace paragraph. The composite uses H_c on both sides. The identity cover of A¹ has nonzero H_c² and zero ordinary H², so the printed direct-factor target loses an essential subscript.

### E2 — misprint

Published p.229, §9.2.1, last paragraph before the footnote; same expression in author GSS.pdf. Affects: nothing.

Printed: x₀ ∈ π₁(X₀,x)

Correction: The x₀ indexing its residue field and Frobenius F_x₀ is a closed point of X₀; use x₀∈|X₀|.

Check: Independently checked published p.229 and author p.17. The chosen objects are closed points with Frobenius conjugacy classes, not elements of the fundamental group; replace the membership target by the closed points of X₀.

### E3 — gap

Published Theorem 9.1(1)–(2), p.226, versus the root-exponential step p.227; author version has the same scope. Affects: a stated result.

Printed: (9.1.1) G is smooth over Zℓ; (9.1.2) the reductive quotient has the stated rank/root comparison, with no ℓ bound attached.

Correction: Either supply an argument for the missing small-prime range, or restrict parts(9.1.1)–(9.1.2) to the sufficiently-large-prime scope justified by the proof. No counterexample to these assertions is claimed.

Check: Independently checked Theorem9.1 p.226 and its proof p.227. Parts(1) and(2) have no prime bound in the statement, but the displayed integral root exponential is justified only for ℓ≥r. This verifies a proof-scope gap, not a counterexample to unrestricted smoothness or rank. The geometric application uses sufficiently large primes.

### E4 — misprint

Published p.233, bibliography [BT84]. Affects: nothing.

Printed: 197–376; SB_1988-1989__31__7_0

Correction: The Bruhat–Tits II article is Publications Mathématiques de l'IHÉS 60 (1984), pp.5–184, https://www.numdam.org/item/PMIHES_1984__60__5_0/ .

Check: Independently checked published p.233, the author bibliography, and both Numdam records. PMIHES_1984__60__5_0 is Bruhat–Tits II, pp.5–184, DOI10.1007/BF02700560; the printed SB identifier is Tits’s 1989 Kac–Moody talk.

### E5 — misprint

External prerequisite Larsen2010, Lemma4 proof, pp.1033–1034, official published PDF; rendered pages inspected. Affects: the proof.

Printed: Y′ = W_U ∐ Y′₁

Correction: Use the closed image family C_U for the open-stratum part of Y′, not the boundary W_U; the map ψ:X′→X restricts to U→X. Verify the reduced-image construction separately.

Check: Independently checked the complete Larsen Lemma4 proof. W is a boundary and U avoids its image, so W_U is empty. For X=Z=Y=Spec Q and ξ=id, the claimed fibre must instead be a point. The open-stratum family must be the reduced closed image C_U; ψ restricts on U. This confirms the printed construction fails, while the corrected family still needs the geometric-reducedness and base-change argument.

### E6 — misprint

External Larsen2010 p.1032, paragraph defining the projective compactification before Proposition3. Affects: nothing.

Printed: Z ∪ (P^(n²)_Z ∖ GL_(n,Z))

Correction: Replace Z by K in the union, and give that closed subset its reduced scheme structure.

Check: Z is the parameter base, while K is the closed subvariety of the GL open being compactified. There is no specified embedding of the base Z into projective space. The following uses and p.1036 correctly form G_F union the entire projective boundary. Checked in the rendered publisher PDF.

### E7 — misprint

External Larsen2010 p.1032, Proposition3 proof, immediately after stratifying W. Affects: nothing.

Printed: nilpotent Lie algebras

Correction: Replace nilpotent by nilpotently generated.

Check: The stratum parametrizes spans of nilpotent matrices closed under bracket. Such a Lie algebra need not be nilpotent: over Q, E=E₁₂, F=E₂₁ and N=[[1,1],[-1,-1]] are nilpotent and span sl₂ because N−E+F=diag(1,−1). Their span is perfect, hence not nilpotent. The surrounding definition and Nori correspondence require nilpotently generated. Checked in the rendered publisher PDF.

### E8 — misprint

External Larsen2010 p.1036, Theorem7 proof, Hilbert-scheme pullback paragraph. Affects: nothing.

Printed: an O-flat subscheme of GL_(n,O)

Correction: The pulled-back universal closed subscheme lies in P^(n²)_O; its generic fibre is the compactification Gbar_F. Intersect with GL_(n,O) only in the next sentence.

Check: The universal Hilbert family was defined inside projective space and includes the whole projective boundary, so its pullback cannot lie in the GL open. The next sentence performs exactly the required open intersection to obtain the affine group model. Checked in the rendered publisher PDF.

The [correct Bruhat–Tits record](https://www.numdam.org/item/PMIHES_1984__60__5_0/) and the [printed Kac–Moody identifier](https://www.numdam.org/item/SB_1988-1989__31__7_0/) were both opened. The author publication page, Annals page, arXiv record, MSP index and exact-title correction searches are recorded in `sourceIssues.searched`. No matching corrigendum was located within that search; novelty is not proved by absence of a search result.

## Outstanding work

- **G1 (open):** Verify recursive originals for Gabber/Suh, CT13 and CT16 uniform-image assertions, CT12, Nori A/B, Jantzen/Larsen95b, Larsen–Pink92/95 and Milne–Ramachandran. Larsen2010 is now fully read: close its Nori correspondence, Serre analytic-growth, finite extension/Jordan component, Kneser ramified splitting, EGA reduced-family/Hilbert properness/component-constructibility and Lang/finite-field point-count inputs. Review and repair E5 before exporting Lemma4. Gabber/Suh, CT13, CT16, CT12, Nori, Jantzen/Larsen, Larsen–Pink and Milne–Ramachandran are cited suppliers; E5 records the Larsen 2010 slip.
- **G2 (open):** Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient. The full CRT lattice/subquotient argument is now in116. Remaining work is the uniform finite assembly with fibre powers, duals, relative-dimension components and determinant twists. Typed Lean implementation alone is not an extraction blocker.
- **G3 (open):** The generic degree-one coefficient arguments are now supplied in147–155: canonical/explicit algebraic comparison, continuous sections, invariant reduction, rationalization kernel and compact localization, finite-tower H1 comparison, and conditional quotient surjectivity. Remaining source closure is the precise affine-curve cdℓ≤1, finite-coefficient H1 finiteness and group/étale-sheaf H1 comparison needed to discharge155 for item48. Typed implementations and the canonical naturality checks remain downstream R02.1 work, not asserted library theorems. In particular transport the geometric H2 vanishing to the explicit discrete H2 carrier of156 through the upstream discrete comparison before applying155. The affine-curve cd ≤ 1, finite-coefficient H¹ and group/étale-sheaf comparisons are SGA suppliers.
- **G4 (open):** Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export. Bruhat–Tits big-cell and closure statements are suppliers; the ℓ-range of Theorem 9.1 is E3, and §9.2 uses E_ℓ unramified (ℓ prime to the discriminant).
- **G5 (open):** The CT16 author-version lemma4.2.1.1 is read, and determinant-line fixing, antisymmetrization and conversion to separate tensor bounds are decomposed in120–127. Establish the exact finite-type exponential-family and Chevalley/spreading statement122 over all coefficient algebras. The selected two-pass product and Larsen’s 2r²-pass construction have different parameter counts; do not identify them or infer scheme equality from finite field points. Verify Borel/EGA originals and NoriA for the alternate Lie-tuple family. The CT16 exponential-family and Chevalley spreading statements are suppliers.
- **G6 (open):** Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients. Larsen–Pink's Γ-regular and common-Frobenius statements are suppliers.
- **G7 (open):** Complete the smooth-projective-to-smooth-proper passage in107 and verify Tate1994 §2.9 plus finite generation/nondegeneracy of the numerical pairing. For the later connected-monodromy reduction use Lemma4.2 to descend the semisimplicity and invariant-comparison goals; do not reapply the original Tate assumptions over the extension without proof. MR04 Lemma3.1 was read in the author PDF: it assumes almost-all-ℓ rational Tate hypotheses and invariants→coinvariants, with smooth projectivity in the standing assumptions. The proper-scheme extension and recursive intersection-pairing inputs remain. Its saturation argument precedes the finite extension in CHT; no Tate-fullness preservation under arbitrary finite extension is asserted or needed for that order of argument.
- **G8 (open):** Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work. The independent search found existing ownership for16,33,72,104,117 and the Schur/GL image boundary. Still match generic Hilbert-family/spreading inputs130/131/139 to R09.1 and generic dimension142 to its scheme/algebra foundation before accepting route2; the reviewed CFSG carrier scope supplies no simplicity/order theorem.
- **G9 (deferred):** Future blueprint work expands the suggested files into signatures, API and tests and compiles at the pins. This is downstream formalization work, not an unfulfilled authorized paper deliverable; no Lean file was requested here. Expanding the suggested files is formalization work.

## Validation

The three finite diagnostic programs preserved below were extracted unchanged from the input report and rerun successfully. They check cocycle/quotient formulas, congruences, tensor degrees, determinant splittings, root-exponent products and weight-projector examples. They do not establish infinite topological comparisons or geometric theorems. The small-prime congruence failure in program2 concerns Larsen’s p≥2n hypothesis, not a counterexample to CHT Theorem9.1.

PASS: paper checker; intake (five files, zero problems); all156 preserved IDs;218 acyclic dependency edges; all supplier stages;120 uniquely routed missing items;11 route verdicts;8 independent source verdicts;45 definition APIs and135 planning tests; exact five-file scope against the archive; both input files unchanged on refreshed main. No Lean file was requested, produced or compiled. API names and tests are planning contracts. No statement here claims formalization.

## Current item inventory

### 01. Smooth-proper geometric and arithmetic cohomology representations

**construction; missing.** §1 pp.205–208; §2.1; §6.

In F construct continuous π and π₀ actions on Hℓ∞,Hℓ,Vℓ∞ and their restriction, base-point transport and finite-field models. Retain the full grading and coefficient topology; total rank is finite and independent of ℓ after the large-prime torsion-free comparison.

API:

- `cohomologyRepresentation.restrict_geometric` (compatibility): Restriction along the geometric fundamental-group inclusion is the geometric cohomology representation, degree by degree.
- `cohomologyRepresentation.coefficient_map` (functoriality): The natural integral-to-rational and integral-to-residual cohomology maps are equivariant; the latter is an isomorphism under item22, not without torsion hypotheses.

Uses:

- CHT §§4,6: change coefficients and restrict arithmetic action to the geometric group

Planning tests:

- A geometric point has trivial geometric action
- For P¹ retain degrees 0 and 2 and the Tate twist
- Integral torsion obstructs naive identification of reduction with cohomology

### 02. Geometric mod-ℓ semisimplicity

**definition; missing.** §1, Theorem 1.1.

In F, semisimplicity means every π-stable Fℓ-subspace of Hℓ has a π-stable complement. This concerns the geometric group π, not the arithmetic group π₀.

API:

- `geometricSemisimple.iff_retraction` (characterisation): Every geometric-stable inclusion admits an equivariant linear retraction if and only if the representation is semisimple.
- `geometricSemisimple.directSum` (compatibility): A finite direct sum is semisimple if and only if each summand is semisimple.

Uses:

- CHT Theorem1.1 and §10: split every stable subspace

Planning tests:

- trivial representation splits
- a nontrivial unipotent Jordan block does not split
- purity alone does not imply arithmetic splitting

### 03. Geometric semisimplicity for all large primes

**theorem; missing.** Theorem 1.1 p.206; §§9–10.

In F there is B(f) such that π acts semisimply on Hℓ for every prime ℓ> B(f), ℓ≠p. Both proof branches §§9 and 10 are extracted separately; no arithmetic Frobenius semisimplicity is assumed.

Dependencies: 99, 103.

### 04. Hyperspecial and almost-hyperspecial compact subgroup

**definition; missing.** §1.2 p.206; §8 pp.223–224.

For connected semisimple G/Qℓ, a compact subgroup is hyperspecial if it is 𝒢(Zℓ) for a semisimple Zℓ-model 𝒢 with specified generic-fibre identification. A compact Γ⊂G(Qℓ) is almost hyperspecial when its full inverse image under Gsc(Qℓ)→G(Qℓ) is hyperspecial.

API:

- `almostHyperspecial.iff_pullback` (characterisation): For semisimple G, the predicate holds exactly when the full inverse image in Gsc(Qℓ) is the Zℓ-points of a semisimple model with its generic-fibre identification.
- `almostHyperspecial.conjugate` (compatibility): Transporting the model and compact subgroup by a generic-fibre isomorphism preserves hyperspeciality and almost hyperspeciality.

Uses:

- CHT Corollary8.2: pass through the simply connected central cover

Planning tests:

- SL₂(Zℓ) in SL₂(Qℓ)
- almost-hyperspecial need not equal all model points
- a torus is outside the stated semisimple domain

### 05. Almost-hyperspecial geometric image

**theorem; missing.** Theorem 1.2 p.206; §8.

In F, after replacing X by one connected finite étale cover independent of ℓ, for all sufficiently large ℓ the geometric image Π∞ is almost hyperspecial in its connected semisimple Qℓ-Zariski closure. This is the equivalence with Theorem 1.1 established in Corollary 8.2, not an assertion that Π∞ itself is hyperspecial.

Dependencies: 03, 81.

### 06. Rational Young symmetrizer normalization already built

**theorem; library.** §1.3 p.208, rational precursor.

For a tableau t on a Young diagram of size d, the rational group-algebra Young symmetrizer satisfies c_t²=(d!/dim_Q spechtIdeal(t))c_t and (dim_Q spechtIdeal(t)/d!)c_t is idempotent. This is the rational precursor only; no integral coefficient change is credited.

Library: tauceti:TauCeti.YoungTableau.youngSymmetrizer_sq, tauceti:TauCeti.YoungTableau.isIdempotentElem_smul_youngSymmetrizer.

### 07. Integral Young symmetrizers and invertible normalization

**construction; missing.** §1.3 p.208; Lemma 4.4.

For λ⊢d construct cλ in Z[S_d], prove cλ²=nλcλ with nλ=d!/dim_Q Sλ a positive divisor of d!, and for a Zℓ-algebra with ℓ>d use nλ⁻¹cλ. Relate the paper's right action/order convention to the existing left-action rational construction explicitly.

Dependencies: 06.

Proof outline:

1. Define row and signed column sums in Z[S_d]. Their product has identity coefficient 1, because row and column stabilizers intersect trivially. Map coefficientwise into the existing rational group algebra.
2. Read item06: c²=(d!/dim Specht)c. Taking the identity coefficient shows the rational scalar is an integer n, namely the identity coefficient of the integral c². Since dim Specht is a positive integer, n>0 and n*dim Specht=d!, hence n divides d!.
3. Injectivity of Z[S_d]→Q[S_d] descends c²=nc. If d! is a unit in R, n is a unit and e=n⁻¹c is idempotent. Transport to Zℓ/Fℓ for ℓ>d.
4. For a right action, transport through the group-algebra anti-involution σ↦σ⁻¹; record the resulting reversal of row/column product. Base change commutes with the finite sums and this identity.

API:

- `integralYoungProjector.idempotent` (structure): For λ⊢d and ℓ>d, eλ=nλ⁻¹cλ satisfies eλ²=eλ in the integral group algebra.
- `integralYoungProjector.baseChange` (compatibility): Under a ring map on which nλ is invertible, the image projector is obtained by applying that map to the integral coefficients.

Uses:

- CHT Lemma4.4: realize Schur functors as coefficient-compatible direct summands

Planning tests:

- For d=0 the projector is identity
- The row and column partitions give symmetrization and antisymmetrization
- At ℓ dividing nλ the normalized expression is unavailable

### 08. Integral and mixed Schur functors

**definition; missing.** §1.3 p.208; §4.

For finite-free Zℓ-module M with continuous Π-action and λ⊢d with ℓ>d, Sλ(M)=image(nλ⁻¹cλ on M⊗d); put Sλ,μ(M)=Sλ(M)⊗Sμ(M∨), μ⊢e, ℓ>e. Prove functoriality, finite freeness, direct-factor projector, base change, continuity, and symmetric/exterior extreme partitions.

Dependencies: 07, 98.

Proof outline:

1. The diagonal action on tensor powers commutes with factor permutations. Its image under the integral idempotent is an equivariant direct summand.
2. A finite projective summand over Zℓ is finite free. Base change preserves the idempotent decomposition, hence identifies its image with the image after scalar extension.
3. Tensor these constructions with the contragredient construction on the dual. Use the two-variable variance in the API; joint continuity follows from finite matrix coordinates.

API:

- `integralSchur.map_comp` (functoriality): Applying the projector to tensor powers of linear maps defines maps preserving identities and composition.
- `integralSchur.baseChange` (compatibility): The image of the idempotent projector commutes with scalar extension; over Zℓ it is finite free and a direct summand. Mixed functors use the contragredient dual.
- `mixedSchur.transportIso` (functoriality): An equivariant lattice isomorphism transports the covariant tensor factors by f and the contragredient factors by the dual of f inverse. For arbitrary maps use the bifunctor covariant in M and contravariant in N; a mixed tensor of a single module is not covariant under arbitrary linear maps.

Uses:

- CHT Theorem1.3 and Lemma4.4: tensor, dual and reduce lattices

Planning tests:

- λ=(d) gives Sym^d
- λ=(1^d) gives Λ^d
- degree zero gives unit; ℓ≤d needs a separate construction

### 09. Invariant reduction predicate

**definition; missing.** §1.3 p.208.

InvΠ(M) is the canonical coefficient-reduction isomorphism in convention I. Construct its map, and prove M^Π saturated in M; do not define the predicate as equality of dimensions without constructing the map.

API:

- `invariantReduction.map` (constructor): Reduction of fixed vectors induces the canonical injection M^Π/ℓ→(M/ℓ)^Π because the invariant lattice is saturated.
- `invariantReduction.iff_H1_no_l_torsion` (characterisation): Under the compact-coefficient exact sequence in item10, this injection is surjective exactly when H¹_cont(Π,M)[ℓ]=0.

Uses:

- CHT §§5,10: measure the torsion obstruction in H¹

Planning tests:

- trivial lattice
- finite group of order prime to ℓ
- a rank-two unipotent action congruent to 1 mod ℓ where Inv fails

### 10. Invariant reduction and H¹ torsion

**theorem; planned.** §1.3 p.208, (Inv).

For a finite free continuous Zℓ-lattice M, surjectivity M^G/ℓ→(M/ℓ)^G is equivalent to H1_cont(G,M)[ℓ]=0 and to Zℓ-torsion-freeness of H1. Item150 supplies the exact sequence directly;151 supplies the DVR torsion argument. For profinite G,148 identifies this with canonical cohomology.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 150, 151, 148.

Proof outline:

1. Apply exactness150; absence of ℓ-torsion excludes every ℓ-power torsion class inductively, and every nonzero element of Zℓ is a unit times a power of ℓ.

### 11. Invariant reduction for fixed mixed Schur tensors

**theorem; missing.** Theorem 1.3(0) p.208.

In F, for fixed d,e≥0, uniformly over partitions λ⊢d,μ⊢e, Invπ(Sλ,μ(Hℓ∞)) holds for all sufficiently large ℓ depending on f,d,e.

Dependencies: 36, 37.

### 12. Invariant reduction for arithmetic-stable free quotients

**theorem; missing.** Theorem 1.3(1) p.208.

In F and the same fixed d,e, Invπ(M) holds uniformly for every π₀-equivariant torsion-free quotient Sλ,μ(Hℓ∞)↠M, for all sufficiently large ℓ depending on f,d,e, not the chosen quotient.

Dependencies: 36, 38.

### 13. Invariant reduction for arithmetic-stable saturated submodules

**theorem; missing.** Theorem 1.3(2) p.208.

In F and the same fixed d,e, Invπ(M) holds uniformly for every π₀-stable M⊂Sλ,μ(Hℓ∞) with torsion-free cokernel, for all sufficiently large ℓ depending on f,d,e, not the chosen submodule.

Dependencies: 36, 39.

### 14. Symmetric and exterior invariant comparisons

**theorem; missing.** §1.3 following Theorem 1.3.

Theorem 1.3 specializes to Sym^d, Λ^d and their mixed dual tensors through the row/column partitions. The integral idempotent comparison uses ℓ>d; this is not a claim for arbitrary small characteristic or arbitrary modular Schur subquotients.

### 15. Lisse sheaves and fundamental-group representations

**construction; missing.** §2.2 pp.210–211.

For connected X in F and Λ=Zℓ or Fℓ, identify the relevant lisse Λ-sheaves with continuous finite-generated Λ-representations of π₁(X,x), with stalk transport up to the chosen path. Establish H⁰(X,F)=F_x^π and the arithmetic action under descent.

API:

- `lisseRepresentation.stalk` (projection): The chosen geometric stalk gives the continuous fundamental-group representation, with transport under a chosen path.
- `lisseRepresentation.globalSections` (compatibility): H⁰ of the lisse sheaf identifies with the fixed vectors in that stalk; descent retains the arithmetic quotient action.

Uses:

- CHT §2.1 and Lemma5.3: identify stalk invariants and cohomology

Planning tests:

- A constant finite free sheaf gives trivial monodromy
- Changing the base point conjugates via the chosen path
- A nonconstant rank-one local system need not have nonzero global sections

### 16. Arithmetic fundamental-group sequence and fibre Frobenius

**theorem; planned.** §2.2 p.211.

For the geometrically connected model X₀/k₀, π₁(X,x)→π₁(X₀,x)→Gal(k₀)→1 is exact. A k₀-rational point supplies a section and realizes the Galois action on geometric global sections by its fibre action. Do not add left injectivity without its hypotheses.

Existing owner: InverseGaloisAndArithmeticFundamentalGroups:IG.1, AnabelianGeometryAndNonabelianChabauty:NC.0.

### 17. Weil weights with every complex embedding

**definition; planned.** §2.2 p.210.

For q>1, a nonzero algebraic number is q-Weil of weight w when all complex embeddings have absolute value q^(w/2). For Frobenius polynomials det(T−F), weights refer to their roots, including multiplicities; duals and Tate twists change weights with geometric-Frobenius conventions.

Existing owner: DeligneWeightsAndPurity:DWP.0.

API:

- `weilWeight.mul` (relation): A product of nonzero algebraic q-Weil numbers of weights a,b has weight a+b, with all complex embeddings tested.
- `weilWeight.inv_pow` (compatibility): Inversion negates weight; the dth power of a q-Weil number of weight w is q^d-Weil of weight w.

Uses:

- CHT §§2,5: separate roots of unequal weights

Planning tests:

- q is weight 2
- q⁻¹ is weight −2
- a pure Jordan block still need not be semisimple

### 18. Rational compatible family of Frobenius polynomials

**definition; missing.** §2.2 pp.210–211.

For sheaves on a finite-field model, require at each closed point away from the coefficient characteristic that det(T−F_x) lies in Q[T] and is independent of ℓ. Compatibility is a property of actual representations, and does not automatically pass to an arbitrary subquotient.

API:

- `rationalCompatibleSystem.localPolynomial` (projection): For each eligible closed point extract the common rational polynomial identified with det(T−F_x) in every realization.
- `rationalCompatibleSystem.finiteFieldBaseChange` (compatibility): After a residue-field extension of degree d the local roots become their dth powers, preserving coefficient independence.

Uses:

- CHT Facts3.2–3.3 and §9.2: use one Frobenius polynomial for all coefficients

Planning tests:

- constant compatible system
- two systems with different point polynomials fail
- subquotients need their own compatibility argument

### 19. Primitive integral reduction of rational polynomials

**construction; missing.** §2.3 p.211.

For nonzero P=Σa_nT^n∈Q[T], let a(P)>0 have valuations −min_n v_p(a_n) for every prime p. Then a(P)P is primitive integral and its reduction modulo each ℓ is nonzero. Use that reduction when writing P(F)=0 over Fℓ, not an undefined reduction of denominators.

Read Localization/Integral.lean50–55 and Polynomial/Content.lean227–247 at082e2d3. Clear denominators with the existing integerNormalization and take its existing primPart. Only the positive-rational scalar/valuation-product comparison, fixed sign and nonzero reductions belong to this adapter; do not rebuild denominator clearing or polynomial content.

Existing library inputs: mathlib:IsLocalization.integerNormalization, mathlib:IsLocalization.integerNormalization_spec, mathlib:Polynomial.primPart, mathlib:Polynomial.isPrimitive_primPart.

API:

- `primitivePolynomial.content_one` (characterisation): Multiplication by the unique positive rational a(P) with valuations −min_i v_p(a_i) gives an integral polynomial of content one.
- `primitivePolynomial.reduction_ne_zero` (simp): For nonzero P its primitive integral normalization has nonzero reduction at every prime; degree can drop at primes dividing its leading coefficient.

Uses:

- CHT §2.3 and Lemmas5.1–5.3: reduce rational annihilators modulo any prime

Planning tests:

- P=(T+1)/2 normalizes to T+1
- P=2T+3 stays primitive and drops degree modulo2
- Zero is excluded from a(P)

### 20. Continuous-cohomology object already built

**construction; library.** §1.3 and §§2,5,10, foundational carrier.

For a topological representation A:TopRep k G, continuousCohomology n A is the homology of its complex of invariant homogeneous continuous cochains, as a TopModuleCat k object. This credit does not supply compact-coefficient exactness, ℓ-adic rationalization or the comparison with explicit H¹.

Library: mathlib:continuousCohomology.

API:

- `continuousCohomology.cochain_homology` (characterisation): The library object is the homology of the continuous homogeneous-cochain complex in TopRep coefficients.
- `continuousCohomology.comparison_request` (compatibility): The extension-cocycle application requires a comparison with the explicit H¹ carrier; this is a request, not a credited theorem.

Uses:

- CHT §10: reuse the canonical cohomology object

Planning tests:

- A trivial group has the expected degree-zero fixed vectors
- Continuous cochains retain coefficient topology
- The object alone does not supply a compact-coefficient long exact sequence

### 21. Gabber–Suh uniform torsion-freeness

**theorem; missing.** Fact 3.1 p.212.

In F, H*(Yx,Zℓ) is torsion-free for all sufficiently large ℓ, simultaneously in every cohomological degree. Smooth proper base change transports this to the family; the bound concerns a fixed family, not all smooth proper varieties.

Dependencies: 23.

### 22. Uniform cohomological reduction

**theorem; missing.** Fact 3.1 p.212.

In F and for the same large-prime range, the canonical H*(Yx,Zℓ)⊗Fℓ→H*(Yx,Fℓ) is an isomorphism compatible with monodromy. This uses adjacent-degree torsion-freeness, not merely freeness in the displayed degree.

Dependencies: 21.

### 23. Smooth-proper rational compatibility and purity

**theorem; planned.** Fact 3.2 p.212; §5.

For a smooth proper finite-field family, the Frobenius polynomials on R^wf_*Qℓ are rational and independent of ℓ and all roots have weight w. Geometric semisimplicity follows from the pure-lisse theorem on a normal base, not from arithmetic semisimplicity.

Existing owner: DeligneWeightsAndPurity:DWP.7, DeligneWeightsAndPurity:DWP.8, WeilConjectures:WC.3.

### 24. One cover gives connected geometric and arithmetic monodromy

**theorem; missing.** Fact 3.3 p.212; condition (6.2.2).

In F, after one connected finite étale Galois cover independent of ℓ, all generic geometric Zariski groups are connected semisimple and all arithmetic generic groups are connected. Separate geometric characteristic-zero semisimplicity from independence of the component-group cover.

Dependencies: 23.

### 25. Uniform perfect residual geometric image

**theorem; missing.** Fact 3.4 p.212; condition (6.2.1).

In F, after one connected finite étale Galois cover independent of ℓ, the geometric mod-ℓ images are perfect for every sufficiently large ℓ.

### 26. Uniform order-ℓ generation of residual images

**theorem; missing.** Fact 3.4 p.212; condition (6.2.1).

With the same kind of fixed cover as Fact 3.4, for every sufficiently large ℓ the residual geometric image is generated by its elements of order ℓ. This is stronger than just having an ℓ-Sylow subgroup and is a separate input to Nori theory.

### 27. Prime-to-index descent for Inv

**theorem; missing.** Lemma 4.2(1) p.213.

For closed normal open U⊂Π of index prime to ℓ and a finite-free continuous Zℓ-representation M, Inv_U(M) implies Inv_Π(M), by exactness of finite-group invariants after averaging.

Proof outline:

1. An invariant residual vector has an invariant lift under U by Inv_U. Average this lift over the finite quotient Π/U, dividing by its order, a unit in Zℓ. The average is Π-invariant and reduces to the original vector. This elementary proof needs no compact-coefficient long exact sequence.

### 28. Prime-to-index descent for semisimplicity

**theorem; missing.** Lemma 4.2(2) p.213.

For U normal open in profinite Π with ℓ∤[Π:U], a finite-dimensional continuous Fℓ-representation semisimple upon restriction to U is semisimple for Π. Average a U-equivariant splitting over Π/U; normality and invertibility of the index are essential.

### 29. Geometric monodromy comparison with a finite-field curve

**theorem; missing.** Lemma 4.3 pp.213–214.

In F there exist a smooth geometrically connected finite-field curve, a smooth proper family over it and one fixed normal open subgroup U of the original π such that their geometric images identify on Zℓ and Fℓ cohomology for all sufficiently large ℓ. The construction uses Bertini, spreading, tame specialization and smooth proper base change; an arbitrary arithmetic specialization does not give this assertion.

### 30. Bertini curve with fundamental-group surjection

**construction; missing.** Lemma 4.3 proof p.214, [Jou83, Thm. 6.10].

After permissible finitely generated-field/base-point enlargement, choose a smooth geometrically connected curve mapping to X₀ whose geometric π₁ surjects onto the required geometric monodromy quotient; preserve the restricted smooth proper family. This is the source-qualified Jouanolou input to Lemma 4.3, not a claim that every curve has surjective π₁.

API:

- `bertiniMonodromyCurve.map` (projection): Expose the smooth geometrically connected curve and its map after the permitted base change.
- `bertiniMonodromyCurve.image_surjective` (structure): The geometric fundamental-group map surjects onto the specified simultaneous monodromy quotient; restricting representations factoring through that quotient preserves their images.

Uses:

- CHT §4.3: reduce the geometric image to dimension one

Planning tests:

- A curve may use its identity morphism
- A constant map into a positive-genus base need not surject on π₁
- Restriction preserves the images of all coefficient representations factoring through the specified quotient; it says nothing about other representations.

### 31. Uniform tame reduction and specialization

**theorem; missing.** Lemma 4.3 proof p.214.

Use de Jong to make boundary inertia potentially unipotent uniformly in ℓ on one cover; for ℓ≠p unipotent congruence images are pro-ℓ, so wild pro-p inertia is killed. Specialize the resulting tame representation to a finite-field curve and compare fibres by smooth proper base change. Retain the one-cover quantifier and both coefficient levels.

### 32. Alteration with smooth compactification and normal-crossing boundary

**theorem; planned.** Lemma 4.3; Lemma 5.2, [dJ96, Thm. 4.1].

For the integral finite-type schemes over the perfect fields arising in §§4–5, use a proper dominant generically finite, generically étale alteration to a smooth scheme admitting a smooth projective compactification with strict normal-crossing boundary. Restrict to an open on which it is finite étale of degree δ before using trace splitting.

Existing owner: AdicCoefficientsAndComparisons:L5.

### 33. Fibre-power Künneth realization of total tensor powers

**theorem; planned.** §4.3.1 p.215; §10.1 p.231.

For the d-fold fibre product of the smooth proper family, integral Künneth gives H*(Yx^[d],Zℓ)≅H*(Yx,Zℓ)⊗d after all torsion terms vanish; the comparison is arithmetic-equivariant and compatible with reduction. Rational or derived Künneth alone is not the integral direct-sum statement.

 Import the finite/integral derived Künneth package through EDC.0/PR196, then use uniform torsion freeness to obtain this ordinary graded comparison. No new six-functor construction.

Existing owner: EtaleDualityAndPerverseSheaves:EDC.0.

Dependencies: 21, 22.

### 34. Poincaré duality with twist and support retained

**theorem; planned.** §4; Lemma 5.3 p.218.

For smooth pure-dimensional Y over an algebraically closed field, coefficients Λ=Qℓ or Fℓ, ℓ≠p, there is perfect duality, equivariant for descent data (in particular geometric Frobenius when a finite-field model is given), H^i(Y,Λ)≅H_c^(2dimY−i)(Y,Λ)(dimY)∨. For proper smooth fibres this identifies dual cohomology with complementary degree and the correct Tate twist; integral use requires its torsion-free comparison.

Existing owner: EtaleDualityAndPerverseSheaves:EDC.2.

### 35. Schur direct-factor inheritance of invariant reduction

**theorem; missing.** Lemma 4.4 p.215.

For 0≤d,e<ℓ, the normalized Young projectors make Sλ,μ(M) a Π-equivariant direct summand of M⊗d⊗(M∨)⊗e. Inv for the ambient tensor object implies Inv for that summand; extend the reduction to arithmetic-stable free quotients and saturated submodules with the induced projector maps.

Dependencies: 08, 09.

Proof outline:

1. Write the equivariant projector decomposition T=S⊕S′. Taking fixed vectors and reducing both commute with this finite direct sum. The invariant-reduction comparison is block diagonal, so an isomorphism on T gives an isomorphism on S.
2. A free quotient of S extends to a free quotient of T by mapping S′ to zero. A saturated submodule of S is saturated in T. The same exceptional-prime bound therefore works for these subquotients.

### 36. Reduction to untensored finite-field curve results

**theorem; missing.** Proposition 4.1 pp.212–213.

Theorem 4.5 for ordinary cohomology on finite-field curves implies Theorem 1.3 in F, by Lemmas 4.2–4.4, fibre powers, finite direct sums, duality and twists. The same curve reduction transfers the geometric semisimplicity assertion. The integral Frobenius-projector dévissage is supplied in item 116.

### 37. Curve invariant reduction

**theorem; missing.** Theorem 4.5(0) p.216.

In C, for all sufficiently large ℓ, Invπ(H*(Yx,Zℓ)) holds.

Dependencies: 47.

### 38. Curve free-quotient invariant reduction

**theorem; missing.** Theorem 4.5(1) p.216; §5.2.

In C and for all sufficiently large ℓ uniformly over the quotient, Invπ(M) holds for every π₀-equivariant torsion-free quotient of H*(Yx,Zℓ). The proof first treats a single degree and uses an affine restriction.

Dependencies: 48, 46, 47, 116.

### 39. Curve saturated-submodule invariant reduction

**theorem; missing.** Theorem 4.5(2) p.216; §5.3.

In C and for all sufficiently large ℓ uniformly over the submodule, Invπ(M) holds for every π₀-stable saturated submodule of H*(Yx,Zℓ). The determinant and exterior-dual proof must retain arithmetic twists while using geometric determinant triviality.

Dependencies: 38, 49, 50, 116.

### 40. Torsion characteristic polynomial divides reduction

**theorem; missing.** Lemma 5.1 p.217.

For a finitely generated Zℓ-module H and a Zℓ-linear automorphism F, charpoly(F|H[ℓ]) divides charpoly(F|H/ℓH). For finite H the two Fℓ[F]-modules have equal classes in the finite-length Grothendieck group and hence equal semisimplifications, not necessarily an isomorphism.

### 41. Characteristic polynomial commutes with base change

**theorem; library.** §5.1 and §11, coefficient comparisons.

For R commutative, M finite free over R, f∈End_R(M) and commutative R-algebra A, charpoly(f_A)=map(R→A,charpoly(f)). This general theorem covers rationalization and reduction of a free lattice; it does not by itself prove Lemma 5.1 for torsion H.

Library: mathlib:LinearMap.charpoly_baseChange.

### 42. Uniform compact-support annihilator over Qℓ

**theorem; missing.** Lemma 5.2 p.217.

For separated finite-type Y₀/F_q and w≥0, there is nonzero P≤w,Y₀∈Q[T] independent of ℓ≠p, all roots q-Weil of weights≤w, annihilating geometric Frobenius on H_c^w(Y,Qℓ) for every ℓ≠p. This is an annihilator, not a claimed ℓ-independent characteristic polynomial of arbitrary nonproper cohomology.

Dependencies: 23, 44.

### 43. Uniform compact-support annihilator modulo ℓ

**theorem; missing.** Lemma 5.2 pp.217–218.

For the same Y₀,w, the primitive-integral reduction of a common P≤w,Y₀ as in 42 annihilates H_c^w(Y,Fℓ) for every sufficiently large ℓ. No Weil weight is directly assigned to an Fℓ eigenvalue; it is controlled by reduction of a rational polynomial.

Dependencies: 21, 22, 44.

### 44. Annihilator descent and dimension induction

**construction; missing.** Lemma 5.2 proof pp.217–218.

Descend a bound from F_q^d using P(T^d). Reduce nilpotents, separate irreducible components by lower-dimensional closed strata, alter the open integral part, and use localization to multiply annihilators. Choose one alteration first, then exclude primes dividing its degree; retain the compact-support groups throughout.

Dependencies: 32, 45.

API:

- `uniformAnnihilator.constantExtension` (compatibility): An annihilator P for F^d pulls back to P(T^d) for F.
- `uniformAnnihilator.localization_product` (constructor): For the compact-support localization sequence, multiply annihilators on the open and closed pieces; use trace descent only away from the fixed alteration degree.

Uses:

- CHT Lemma5.2: perform dimension induction with compact support

Planning tests:

- For extension degree1 keep P
- For A¹ retain compact support in degree2
- A prime dividing the alteration degree prevents trace splitting

### 45. Finite étale compact-support trace splitting

**theorem; planned.** Lemma 5.2 p.218; corrected E1.

For finite étale U′→U of degree δ over a finite field and Λ=Qℓ or Fℓ with δ invertible, pullback and trace on H_c^w compose to δ·id. Thus H_c^w(U,Λ) is a Frobenius-equivariant direct summand of H_c^w(U′,Λ), not ordinary H^w(U′,Λ).

Existing owner: EtaleDualityAndPerverseSheaves:EDC.2.

### 46. Curve Leray edge and high-weight annihilator

**theorem; missing.** Lemma 5.3 p.218.

In C, for Λ=Qℓ (all ℓ≠p) or Fℓ (all sufficiently large ℓ), H¹(X,R^wf_*Λ)=E₂^(1,w)=E∞^(1,w) is a subquotient of H^(w+1)(Y,Λ). Smooth duality and 42–43 produce a common rational annihilator P≥w+1 with roots of weights≥w+1; for dimY=D use T^degP P(q^D/T) from P≤2D−w−1. The formula with D applies to a pure-dimensional component. For nonpure Y, first pass to a finite constant-field extension fixing its finitely many components, apply the formula with each component dimension, multiply the resulting annihilators, and descend the Frobenius power using44. No single pure-dimensional duality formula is asserted for a nonpure Y.

Dependencies: 34, 42, 43.

### 47. Weight-separated annihilators kill torsion

**theorem; missing.** §5.1 pp.216–217.

In C the ℓ-torsion of H¹(X,R^wf_*Zℓ) is killed by reduction of P_w from a rational-point fibre (roots weight w) and by P≥w+1. Distinct weights make the rational polynomials coprime; a nonzero integer Bézout resultant excludes finitely many primes, making the two reduced polynomials coprime and forcing the torsion module to vanish.

Dependencies: 40, 41, 46.

### 48. Affine curve H¹ quotient surjectivity

**theorem; missing.** §5.2 pp.218–219.

For X a smooth affine geometric curve and finite-free continuous Zℓ representations H↠M with free kernel, the requisite cdℓ≤1 and compact-coefficient comparison give H¹(π,H)↠H¹(π,M). In the arithmetic-equivariant single-degree application H=H^w(Yx,Zℓ), this transports the same high-weight annihilator to every quotient M.

Dependencies: 155.

Proof outline:

1. Import affine-curve cdℓ≤1 and finiteness for finite locally constant ℓ-primary coefficients, with ℓ different from the geometric characteristic; verify the group/sheaf comparison. These are the remaining G3 geometric inputs.
2. Apply155 to each arithmetic-stable free quotient of the original lattice. Every construction is natural for the arithmetic action, so surjectivity transports the original high-weight annihilator.

### 49. Geometric determinants of saturated submodules are trivial

**theorem; missing.** §5.3 p.219, [CT12, Thm.5.7].

After the fixed covers of Facts 3.3–4, Π∞ has finite abelianization and is generated by pro-ℓ Sylows. For large ℓ>2, its determinant character on any invariant free submodule M has finite image in Zℓ× of order dividing ℓ−1, so is trivial. This conclusion is geometric; the arithmetic determinant character may be nontrivial.

Dependencies: 24, 25, 26.

### 50. Determinant duality reduces saturated submodules to quotients

**construction; missing.** §5.3 p.219.

For M free of rank m≥1, the wedge map identifies M with (Λ^(m−1)M)∨⊗det(M). For M saturated in a single H^w, dualizing and exterior powers give an arithmetic-equivariant free quotient of a complementary-degree fibre-power cohomology group, with Tate twist. Apply quotient Inv after accounting for the geometrically trivial determinant. Treat m=0 separately.

Dependencies: 98.

Proof outline:

1. In a basis of the rank-m free lattice M, wedge evaluation v↦(u↦v∧u) gives M≅Hom(Λ^(m−1)M,det M); the basis matrix has entries ±1. It is basis independent and equivariant.
2. Dualizing a saturated inclusion gives a free quotient. Exterior powers and the determinant identity implement the submodule-to-quotient reduction. Retain the arithmetic determinant character; untwist only the geometric action after item49. Treat M=0 separately.

API:

- `determinantDuality.equiv` (equivalence): For m>0, wedge evaluation identifies M with (Λ^(m−1)M)∨⊗det(M), equivariantly for the full arithmetic action.
- `determinantDuality.geometricUntwist` (compatibility): If the geometric determinant is trivial the geometric representation untwists, while the arithmetic determinant character must still be retained.

Uses:

- CHT §5.3: treat saturated rank-m submodules by free quotients

Planning tests:

- For m=1 retain the determinant line
- Treat rank0 separately
- An arithmetic nontrivial character can be geometrically trivial

### 51. Integral monodromy closure and its two fibres

**definition; missing.** §6 p.220, (6.1).

For a compact image Π∞⊂GL(H) with H finite free over Zℓ, form the reduced schematic Zariski closure 𝒢 in GL(H), generic group Gη⊂GL(H⊗Qℓ), special group Gs⊂GL(H⊗Fℓ). It is flat over Zℓ and dimGs=dimGη; smoothness and connectedness of Gs are conclusions later, not part of this definition.

Dependencies: 01.

API:

- `integralMonodromy.genericFiber` (compatibility): The schematic closure in GL(H) has generic fibre the rational Zariski closure of the image.
- `integralMonodromy.flat` (structure): Its defining ideal is the contraction of the generic ideal, so the coordinate ring is torsion free over the DVR and flat; smoothness is a later theorem.

Uses:

- CHT §§6–9: compare generic and special fibres

Planning tests:

- SL₂ standard lattice
- conjugated lattice changes model
- do not assume special smoothness at definition time

### 52. Subgroup generated by ℓ-Sylows

**definition; missing.** §7.1 pp.220–221.

For closed Π⊂GL_r(Zℓ) or GL_r(Fℓ), Π+ is the closed normal subgroup generated by its ℓ-Sylow subgroups. In the finite residual, dimension-bounded large-prime setting it is generated by order-ℓ elements. Distinguish abstract generation, closed generation, reduction image and full algebraic envelope.

API:

- `plusSubgroup.minimal` (universal-property): The closed subgroup generated by all pro-ℓ Sylow subgroups is contained in every closed subgroup containing those Sylows.
- `plusSubgroup.characteristic` (structure): Automorphisms preserve the collection of Sylows, so the closed generated subgroup is characteristic and normal.

Uses:

- CHT §§7–8: compare residual and compact plus groups

Planning tests:

- finite ℓ-group
- prime-to-ℓ finite group has trivial plus
- SL₂ integral plus-generation

### 53. Bounded mixed tensor space

**definition; missing.** §7.1 pp.220–221.

For finite free H set T≤d(H)=⊕_{0≤s,t≤d}H⊗s⊗(H∨)⊗t. The bounds are separate, so total tensor length can be 2d. Define the pointwise group-scheme stabilizer of its invariant submodule, not merely its setwise stabilizer.

Dependencies: 118.

API:

- `boundedMixedTensor.summand` (constructor): For s≤d and t≤d, include M^⊗s⊗(M∨)^⊗t as its specified direct summand.
- `boundedMixedTensor.action_degree` (relation): For an exponential root subgroup on rank-r M each summand action has parameter degree at most (s+t)(r−1), hence at most 2d(r−1).

Uses:

- CHT Lemma7.1.3 and Theorem7.3: bound polynomial degree and stabilize tensors

Planning tests:

- s=d,t=d is included
- setwise stabilizer of a line is too large
- d=0 gives only trivial-tensor constraints

### 54. Truncated exponential and logarithm for order-ℓ matrices

**construction; missing.** §7.1 p.221.

For ℓ≥r and g∈GL_r(Fℓ) of order ℓ, log(g)=−Σ_{1≤i<ℓ}(1−g)^i/i and exp(tlogg)=Σ_{0≤i<ℓ}(tlogg)^i/i! define a unipotent one-parameter subgroup φ_g:G_a→GL_r. Prove the polynomial inverse identities under the nilpotence/large-prime bound.

API:

- `truncatedExpLog.inverse` (equivalence): In characteristic ℓ≥r, the degree<r exponential and logarithm are inverse on matrices with N^r=0 and (g−1)^r=0.
- `truncatedExpLog.oneParameter` (structure): For fixed N^r=0, exp((a+b)N)=exp(aN)exp(bN), and exp(0N)=1, as polynomial identities.

Uses:

- CHT §7.1 and Larsen Lemma6: pass between nilpotent matrices and unipotents

Planning tests:

- N=0 gives identity
- For N²=0 use exp(tN)=1+tN
- Do not divide by factorials containing the characteristic

### 55. Nori exponential envelope

**definition; missing.** §7.1 p.221.

For Π⊂GL_r(Fℓ), N(Π) is the algebraic subgroup generated by the one-parameter groups φ_g for its order-ℓ elements. It is smooth connected and generated by unipotents; define generation scheme-theoretically and prove independence of choices. This symbol is separate from the composition-factor product used in §8.

Dependencies: 54.

API:

- `noriEnvelope.minimal` (universal-property): The envelope is the smallest closed algebraic subgroup containing every one-parameter exponential attached to an order-ℓ element.
- `noriEnvelope.conjugate` (functoriality): Conjugating the residual representation conjugates each exponential subgroup and its generated envelope.

Uses:

- CHT Theorem7.3: replace the finite image by an algebraic group

Planning tests:

- single upper-unipotent root subgroup
- prime-to-ℓ group gives trivial envelope
- SL₂ upper/lower root subgroups generate

### 56. Nori finite-points plus comparison

**theorem; missing.** Lemma 7.1(1) p.221.

For ℓ sufficiently large depending only on r, N(Π)(Fℓ)+=Π+. This is the group-theoretic input from Nori, not a consequence of Zariski density of the finite set Π.

### 57. Nori invariant-subspace comparison

**theorem; missing.** Lemma 7.1(1) p.221.

Under the same bound, Π+ and N(Π) have exactly the same invariant Fℓ-subspaces of H=Fℓ^r. Scheme-representation invariance is compared with the finite-group action; this does not assert every rational representation is semisimple.

### 58. Uniform bounded-tensor stabilizer

**theorem; missing.** Lemma 7.1(2) p.221, [CT16, Lem.4.1].

There is d(r), independent of ℓ and Π in the large-prime range, such that N(Π) equals the pointwise group-scheme stabilizer in GL(H) of T≤d(r)(H)^N(Π). Its uniformity and scheme-level strength are indispensable. This is the Cadoret–Tamagawa 2016 tensor-stabilizer input, distinct from Nori Theorem B.

Dependencies: 122, 123, 124, 125, 126, 127.

Proof outline:

1. Choose the uniform subspace W_U of122. By123 its setwise stabilizer is the stabilizer of its determinant line.
2. By124 U acts trivially on that line; its pointwise stabilizer is therefore exactly U. Embed the line equivariantly into a tensor power by125.
3. It is a fixed tensor in the expanded bounded tensor family. Any element fixing all U-invariant tensors fixes this one and lies in U; the reverse inclusion is definitional. Use126 to remove multiplicities and take separate degree bounds.
4. This closes the linear-algebra reduction; the family/Chevalley/spreading scheme-level input122 remains G5.

### 59. Bounded tensor invariants agree

**theorem; missing.** Lemma 7.1(3) pp.221–222.

For each fixed d and ℓ sufficiently large depending on r,d, T≤d(H)^N(Π)=T≤d(H)^Π+. For the polynomial interpolation step ℓ>2d(r−1) suffices once the exponential construction is valid; do not replace this with ℓ>d alone.

### 60. Simply connected integral points are plus-generated

**theorem; missing.** Lemma 7.2 p.221.

If 𝒮/Zℓ is a simply connected semisimple group scheme, then 𝒮(Zℓ)=𝒮(Zℓ)+. Use surjectivity of smooth reduction with pro-ℓ kernel and generation of 𝒮(Fℓ) by ℓ-elements.

### 61. Special monodromy fibre equals Nori envelope

**theorem; missing.** Theorem 7.3 pp.221–222.

In G, for every sufficiently large ℓ, Gs=Nℓ as closed group schemes in GL(Hℓ). Invariant reduction and 58–59 give Gs⊂Nℓ; Larsen's dimension comparison and flat dimension equality force equality. Equality of Fℓ-points alone is insufficient.

Dependencies: 11, 51, 56, 58, 59, 113, 142.

### 62. Special-fibre plus image is perfect and enveloping

**theorem; missing.** Theorem 7.3(1) p.221.

In G and for all large ℓ, Gs(Fℓ)+ is perfect and Gs is the Nori envelope of Gs(Fℓ). Preserve both assertions as consequences of 61 and Nori's plus comparison.

### 63. Uniform weak maximality index bound

**theorem; missing.** Theorem 7.3(2) p.222.

In G, there is C_r depending only on r=rank Hℓ∞ with [𝒢(Zℓ):Π∞]≤C_r for all sufficiently large ℓ. This uses Larsen 2010 Theorem 7; bounded index is not index one.

Dependencies: 61, 114.

### 64. Geometric image equals integral-points plus subgroup

**theorem; missing.** Theorem 7.3(2) p.222.

In G and for all sufficiently large ℓ, Π∞=𝒢(Zℓ)+. Combine plus-generation of Π∞, the pro-ℓ congruence kernel and the bounded-index theorem after ℓ>C_r.

Dependencies: 26, 63.

### 65. Integral geometric monodromy closure is smooth connected

**theorem; missing.** Corollary 7.4 p.222.

In G and for all sufficiently large ℓ, 𝒢 is a smooth connected Zℓ-group scheme: flatness and smoothness of generic and Nori special fibres yield smoothness. Semisimplicity of the special fibre is not yet proved.

Dependencies: 51, 61.

### 66. Residual and algebraic module semisimplicity agree

**theorem; missing.** Corollary 7.5, (1)↔(2), p.222.

In G and for all large ℓ, Hℓ is semisimple under Πℓ iff it is semisimple as a representation of Nℓ=Gs, by equality of invariant subspaces.

Dependencies: 57, 61.

### 67. Faithful semisimple Nori module forces semisimple group

**theorem; missing.** Corollary 7.5, (2)→(3), p.222.

In G, semisimplicity of the faithful Gs-module Hℓ implies Gs reductive. Its generation by unipotents removes the central torus, hence Gs is semisimple. Faithful semisimple representation alone would only give reductivity.

Dependencies: 55.

### 68. Low-dimensional representations in large characteristic

**theorem; missing.** Corollary 7.5, (3)→(2), p.222; [Jan97, Prop.3.2], [Lar95b, Thm.3.5].

For a connected semisimple algebraic group over Fℓ, its r-dimensional rational representation is semisimple when ℓ is sufficiently large in terms of r, in the Jantzen/Larsen range used here. The exact cited bound remains external-input gap G1; no Maschke argument with ℓ dividing the group order is allowed.

### 69. Fibre semisimplicity and integral semisimple model

**theorem; missing.** Corollary 7.5, (3)↔(4), p.222.

For the smooth connected 𝒢 of 65 with semisimple generic fibre, Gs semisimple iff 𝒢 is a semisimple Zℓ-group scheme. This is the final equivalence (3)↔(4) of Corollary 7.5, not a definition of an arbitrary flat model as smooth.

Dependencies: 65, 117.

### 70. Field-level semisimple and reductive groups already built

**definition; library.** §§6–9, underlying algebraic group notions.

For finite-type commutative Hopf algebras over a field k, semisimplicity means smoothness and geometric connectedness with no nontrivial smooth connected normal solvable geometric closed subgroup. The pinned scheme-side reductive predicate transports the analogous unipotent-radical condition through the affine Hopf anti-equivalence. These field-level predicates do not supply relative semisimplicity over Zℓ.

Library: tauceti:TauCeti.semisimpleCommHopfAlgProperty, tauceti:TauCeti.semisimpleCommHopfAlgProperty_iff, tauceti:TauCeti.reductiveAffineGroupSchemeProperty.

API:

- `fieldSemisimple.geometricCriterion` (characterisation): The pinned predicate requires smoothness and geometric connectedness and excludes every nontrivial smooth connected normal solvable geometric subgroup.
- `fieldSemisimple.affineHopf` (compatibility): Transport the field-level group predicate through the existing affine group / Hopf algebra anti-equivalence.

Uses:

- CHT §§7–9: distinguish field predicates from integral models

Planning tests:

- SL₂ is the intended semisimple example
- A positive-dimensional torus is not semisimple
- The definition has field input and does not define semisimplicity over Zℓ

### 71. Field-level semisimple implies reductive already built

**theorem; library.** §§7–9, structural algebraic-group input.

Every semisimple finite-type commutative Hopf algebra over a field is reductive, since each smooth connected normal unipotent geometric closed subgroup is solvable. This is a structural implication only, not complete reducibility of all positive-characteristic representations.

Library: tauceti:TauCeti.semisimpleCommHopfAlgProperty.reductive.

### 72. Hyperspecial points and semisimple integral models

**construction; planned.** §8 p.223, [Tit79, §3.8].

For connected semisimple G/Qℓ use the building of Gsc with Gad(Qℓ)-action. Semisimple Zℓ-models with their generic identifications correspond to hyperspecial points; an isogeny extends uniquely between the models attached to the same point. Import buildings and parahoric models, and prove this precise hyperspecial correspondence.

 RG2.3 is the sole owner of the model construction. CHT supplies the precise hyperspecial/isogeny interface to check there; G4 still blocks a proved claim.

Existing owner: ReductiveGroupsPartII:RG2.3.

API:

- `hyperspecialModel.genericIdentification` (data): Expose the semisimple model and its specified identification with the given generic group at the hyperspecial point.
- `hyperspecialModel.isogenyExtension` (compatibility): A central isogeny of generic groups extends between the models attached to the same building point under the Bruhat–Tits hypotheses.

Uses:

- CHT Lemma8.1: compare simply connected integral models

Planning tests:

- SL₂ with its standard Zℓ-model
- A parahoric with nontrivial special unipotent radical is not hyperspecial
- Generic isogeny extension requires the matched building point

### 73. Hyperspecial maximal compactness

**theorem; missing.** §8 p.223, [Tit79, §3.8.2].

A hyperspecial subgroup of a connected semisimple Qℓ-group is maximal among compact subgroups and has maximal volume; its conjugates are hyperspecial. Retain the specified Haar-volume comparison when used, rather than claiming every maximal compact is hyperspecial.

### 74. Nonabelian composition-factor product

**definition; missing.** Lemma 8.1 proof pp.223–224.

For a profinite group Π with an open normal pro-ℓ subgroup, define cna(Π) as the product, with multiplicity, of orders of nonabelian simple factors of a finite quotient by such a subgroup. Prove independence of the quotient using that finite ℓ-groups have only abelian composition factors. Do not multiply an infinite composition series.

API:

- `nonabelianFactorProduct.independent_quotient` (characterisation): Quotienting by different open normal pro-ℓ subgroups gives the same product of orders of nonabelian simple factors, since finite ℓ-groups have only abelian factors.
- `nonabelianFactorProduct.abelian_extension` (relation): An extension with abelian kernel preserves this product; for finite groups the product is multiplicative across a normal subgroup and its quotient.

Uses:

- CHT Lemma8.1: compare compact groups by finite quotients

Planning tests:

- finite abelian group gives 1
- pro-ℓ group gives 1
- A₅ gives 60, with finite product multiplicity

### 75. Composition-factor product under subgroups and abelian extensions

**theorem; missing.** Lemma 8.1 proof pp.223–224.

For the finite-by-pro-ℓ groups in 74, a closed subgroup Π′⊂Π satisfies cna(Π′)≤cna(Π). Extensions with abelian kernel or abelian quotient leave cna unchanged. Establish the finite-group reduction and composition-factor argument, not an unsupported equality of orders.

### 76. Smooth integral reduction with pro-ℓ kernel

**theorem; planned.** Lemma 8.1 proof (1) p.223.

For smooth connected affine finite-type 𝓗/Zℓ, 𝓗(Zℓ)→𝓗(Fℓ) is surjective with pro-ℓ kernel. It preserves cna, also after taking plus subgroups. This is the Hensel/congruence result required by Lemma 8.1.

Existing owner: ReductiveGroupsPartII:RG2.0, ReductiveGroupsPartII:RG2.3.

### 77. Solvable-radical quotient preserves nonabelian factors

**theorem; missing.** Lemma 8.1 proof (2) p.224.

For smooth connected affine H/Fℓ, Lang's theorem makes H(Fℓ)→(H/R(H))(Fℓ) surjective. For sufficiently large ℓ relative to rank, passing to this semisimple quotient or to plus subgroups preserves cna; central-isogeny cokernels have bounded order and are abelian.

### 78. Uniform finite Lie-type composition-factor bounds

**theorem; missing.** Lemma 8.1 proof (3) p.224; [Tit64], [Nor87, Lem.3.5].

For connected semisimple H/Fℓ of dimension d and bounded rank, for all sufficiently large ℓ its nonabelian factors are those of almost-simple factors H_i(Fℓ)+ modulo their centres. There is a rank-dependent c>0 with (ℓ−1)^d/c≤cna(H(Fℓ))≤(ℓ+1)^d. Keep the small-field exceptions and central-isogeny indices explicit.

### 79. Semisimple model comparison via simply connected cover

**theorem; missing.** Lemma 8.1 pp.223–225.

Let G/Qℓ be connected semisimple and 𝒢,𝒮 smooth connected integral models of G,Gsc. Assume 𝒮 semisimple and (psc)⁻¹(𝒢(Zℓ)+) normal in 𝒮(Zℓ) with abelian quotient. For ℓ sufficiently large depending only on dimG, 𝒢 is semisimple. The proof compares cna bounds to force dim(Gs/R(Gs))=dimG; the use of affineness of models is a carrier verification in G4.

Dependencies: 74, 75, 76, 77, 78.

### 80. Simply connected pullback of integral-points plus subgroup

**theorem; missing.** Corollary 8.2 proof, (i)–(ii), p.225.

For semisimple 𝒢/Zℓ and its simply connected semisimple model 𝒮 at the same hyperspecial point, for all large ℓ, (psc)⁻¹(𝒢(Zℓ)+)=𝒮(Zℓ), and 𝒮(Zℓ)↠𝒢(Zℓ)+. Prove the first equality by finite-kernel compactness and maximal compactness; the second uses bounded exponent of the generic central-isogeny cokernel and plus-generation.

Dependencies: 60, 72, 73.

### 81. Semisimplicity iff almost hyperspecial

**theorem; missing.** Corollary 8.2 p.225.

In G and for all sufficiently large ℓ, the four conditions of Corollary 7.5 are equivalent to Π∞ almost hyperspecial in Gη(Qℓ). Forward: 64 and 80. Reverse: Lemma 8.1 applied to the hyperspecial preimage and the smooth model 65.

Dependencies: 64, 65, 66, 67, 68, 69, 79, 80.

### 82. Invariant-dimension defect

**definition; missing.** §9.1 p.226.

In L, for finite-free algebraic 𝒢-representation M, Δ_H(M)=dim_Fℓ((M⊗Fℓ)^(Gs)°)−dim_Qℓ((M⊗Qℓ)^Gη). Construct the generic invariant lattice and reduction injection to prove nonnegativity. The special identity component, not the whole special group, is part of the definition.

API:

- `invariantDefect.nonnegative` (structure): The saturated generic invariant lattice reduces injectively into the special identity-component invariants, so Δ≥0.
- `invariantDefect.directSum` (simp): The defect of a finite direct sum is the sum of the defects, with the same special identity-component convention.

Uses:

- CHT Theorem9.1.3: detect special-fibre radical by dual Lie exterior powers

Planning tests:

- constant trivial module has defect 0
- connected special identity-component convention
- defect criterion only on specified dual Lie exterior powers

### 83. Nice integral model of a maximal torus

**definition; missing.** §9.1 p.226.

The nice-model predicate is convention L's extension of a CLOSED split-torus embedding after finite splitting E/Qℓ, with integral lattice H⊗O_E. Prove it invariant under permitted basis change and faithful flat scalar extension; extending only the pointwise torus action is weaker.

API:

- `niceTorus.closedEmbedding` (projection): Expose the finite splitting field E and closed immersion of the split torus over O_E extending the given generic embedding.
- `niceTorus.basisChange` (compatibility): Conjugation by an integral lattice automorphism transports the torus extension and preserves its closed-immersion property.

Uses:

- CHT §9.2: apply the nice-model criterion to compatible Frobenius

Planning tests:

- diagonal torus on a split lattice
- weight set must generate character lattice
- pointwise injectivity is not closed immersion

### 84. Nice torus implies smooth integral closure in large characteristic

**theorem; missing.** Theorem 9.1(1) p.226; proof p.227.

In L with a nice torus and sufficiently large ℓ (in particular ℓ≥r for the displayed root-exponential proof), 𝒢 is smooth over Zℓ. The printed 9.1.1 omits this bound; record E3 and do not export an unrestricted small-prime theorem from this proof.

Dependencies: 83, 87.

### 85. Nice torus preserves reductive rank and root inclusion

**theorem; missing.** Theorem 9.1(2) pp.226–227; scoped by E3.

Under 84's hypotheses, (Gs)°/Ru((Gs)°) has rank s equal to rankGη, and its geometric root system is a subsystem of that of Gη. Use the special torus and Lie-weight comparison; preserve residue-field/base-extension distinctions.

Dependencies: 84.

### 86. Exterior Lie-defect criterion for semisimple models

**theorem; missing.** Theorem 9.1(3) p.226.

In L with a nice torus, for ℓ sufficiently large depending only on r, write 𝔤=Lie𝒢⊂H⊗H∨. Then 𝒢 is semisimple iff Δ_H(Λ^n𝔤∨)≤0 for every 1≤n≤δ. The bound is on representation dimension, and exterior powers are of the DUAL integral Lie lattice.

Dependencies: 85, 88, 89, 90, 91.

### 87. Integral root groups and big-cell smoothness

**construction; missing.** Theorem 9.1 proof pp.226–227; [BT84, 2.2.3(iii)].

After faithfully flat base change to O_E splitting the nice torus, take primitive generators Nα of root-line intersections with End(H). For ℓ≥r, t↦exp(tNα) identifies their closures with G_a; the ordered U+×T×U− multiplication gives the open big cell. Descend smoothness and the root/rank statement. Do not identify a ramified O_E with Zℓ as rings.

API:

- `integralBigCell.rootMap` (data): For a primitive root-line generator Nα and ℓ≥r, expose the integral polynomial map t↦exp(tNα).
- `integralBigCell.multiplication` (structure): The ordered root groups and split torus have an open-immersion multiplication map under the cited Bruhat–Tits hypotheses; descend smoothness by faithful flatness.

Uses:

- CHT Theorem9.1.1–2: prove smoothness after a possibly ramified splitting extension

Planning tests:

- The two SL₂ root maps give its usual big cell
- Retain O_E for a ramified splitting field
- A small prime dividing a factorial is outside this construction

### 88. First exterior defect excludes the reductive centre

**theorem; missing.** §9.1 Claim 1 pp.227–228.

Under the hypotheses of 86 and Δ_H(𝔤∨)≤0, the reductive quotient of (Gs)° is semisimple. The exact Lie sequence and its dual inject (𝔤rd)∨ into 𝔤s∨; large-characteristic semisimplicity/self-duality of the adjoint module and the zero generic adjoint invariants bound its centre dimension by zero.

Dependencies: 68, 82.

### 89. Exterior-adjoint invariant Poincaré polynomial

**theorem; missing.** §9.1 Claim 2 p.228; [Baz01], [Car72], [Jan97], [Ste68b].

For connected semisimple groups of rank s in characteristic zero, and in sufficiently large positive characteristic depending on s, the dimensions of (Λ^m𝔤)^G are the coefficients of P_G(T)=∏_j(1+T^(2e_j+1)), the multiset e_j of Weyl exponents over all almost-simple factors. For a product, use Λ*(V⊕W)≅Λ*V⊗Λ*W. Prove the large-characteristic transfer, not just the complex Lie-group formula.

### 90. Equal rank and smaller dimension force an exterior invariant excess

**theorem; missing.** §9.1 Claim 2 p.228.

For connected semisimple G/Fℓ and G′/Qℓ of the same rank s, ℓ sufficiently large depending on s, if dimG<dimG′ then some 0≤m≤dimG has dim(Λ^mLieG)^G>dim(Λ^mLieG′)^G′. The Poincaré polynomials have the same value 2^s at 1 and different degree, forcing a coefficient excess below dimG.

Dependencies: 89.

### 91. All exterior defects remove the unipotent radical

**theorem; missing.** §9.1 conclusion p.229, [Con14, Prop.3.1.3].

With 85,88–90 and all Δ_H(Λ^n𝔤∨)≤0, the reductive quotient has dimension δ, so the unipotent radical vanishes. The integral connectedness theorem gives connected special fibre, hence a semisimple model. Conversely semisimple group schemes have locally constant root datum/Poincaré polynomial, giving defect zero.

Dependencies: 85, 88, 90.

### 92. Γ-regular semisimple element

**definition; missing.** §9.2.1 footnote 2 p.229.

For reductive G⊂GL(V) in characteristic zero, a regular semisimple g in its unique maximal torus Tg is Γ-regular when every automorphism of Tg over the algebraic closure fixing g and preserving the formal character is trivial, and the only GL(V)-conjugate of Tg containing g is Tg itself.

API:

- `gammaRegular.uniqueTorus` (projection): The regular element lies in a unique maximal torus and satisfies the additional formal-character-preserving automorphism and conjugate-torus conditions.
- `gammaRegular.conjugate` (compatibility): Conjugating the embedded group and element transports these conditions and the resulting torus.

Uses:

- CHT §9.2.1: identify and split the Frobenius torus

Planning tests:

- regular alone may fail Γ-regularity
- exclude repeated distinct-root collisions
- central scalar is not regular in a higher-rank semisimple group

### 93. Compatible Frobenius gives a nice torus

**theorem; missing.** §9.2.1 pp.229–230; [LP92, Prop.7.2], [LP95, Prop.1.3].

In G, apply Larsen–Pink to the arithmetic semisimplification and lift its Γ-regular torus across the unipotent radical of G′η. One suitable closed point x₀ with common rational polynomial P_x₀, and exclusion of the discriminant primes of its squarefree part, gives integral eigenspace decompositions and a nice model of a geometric maximal torus for all sufficiently large ℓ. Uniformity in the chosen point and the torus lift are external-input checks, not consequences of rational compatibility alone.

### 94. Arithmetic-stable Lie lattice and tensor quotients

**construction; missing.** §9.2.2 p.230.

In G, normality Π∞⊲Π′∞ makes the saturated lattice 𝔤=Lie𝒢⊂End(Hℓ∞) arithmetic-stable. Smoothness identifies its special reduction with LieGs. Dualizing the saturated inclusion and taking exterior powers supplies π₀-equivariant free quotients H⊗n⊗(H∨)⊗n↠Λ^n𝔤∨, with n≤δ≤r².

Dependencies: 24, 65, 98.

API:

- `arithmeticLieLattice.normality_stable` (structure): Normality of geometric monodromy in arithmetic monodromy makes the saturated Lie lattice arithmetic-stable.
- `arithmeticLieLattice.exteriorDualQuotient` (projection): Dualizing the saturated Lie inclusion in End(H) and taking exterior powers gives the arithmetic-equivariant free tensor quotients onto Λ^n Lie∨.

Uses:

- CHT §9.2.2: apply Theorem1.3 to free quotients

Planning tests:

- For SL₂ retain the three-dimensional Lie lattice
- A nonsaturated sublattice need not give a surjection on duals
- Special Lie base change requires the proved smoothness

### 95. Tensor invariant reduction forces Lie defects zero

**theorem; missing.** §9.2.2 p.230, (9.2.2.1)–(9.2.2.2).

Apply Theorem 1.3(1) to 94. Since Gs is connected by Theorem 7.3, dim M^Gs≤dim M^Πℓ in characteristic ℓ, while generic algebraic and Π∞ invariants agree by Zariski density. Integral invariant reduction gives Δ_H(M)≤0 for every Λ^n𝔤∨; then 86 and Corollary 7.5 prove Theorem 1.1.

Dependencies: 12, 61, 86, 93, 94.

### 96. Splitting invariant exterior vectors splits a determinant line

**theorem; missing.** Lemma 10.1, (10.1.3)→(10.1.2), pp.230–231.

In G, let A⊂Hℓ be a Πℓ-submodule of dimension a≥1. If (Λ^aHℓ)^Πℓ↪Λ^aHℓ splits equivariantly, then Λ^aA↪Λ^aHℓ splits: Πℓ+ generation kills the determinant character to Fℓ×, so Λ^aA is a trivial line within the invariant subspace.

Dependencies: 26.

Proof outline:

1. The determinant of A is trivial because the acting finite group is generated by elements of order ℓ and Fℓ× has order prime to ℓ.
2. Compose the assumed equivariant retraction onto the full invariant space with any linear projection of that trivial representation onto the determinant line. No projection from a nontrivial representation is assumed.

### 97. A split determinant inclusion splits the submodule

**theorem; missing.** Lemma 10.1, (10.1.2)→(10.1.1), p.231.

For a finite-dimensional representation H over a field and a stable a-dimensional subspace A, a≥1, an equivariant retraction s:Λ^aH→Λ^aA induces H→A by v↦[u↦s(v∧Λ^(a−1)ι(u))] and A≅Hom(Λ^(a−1)A,Λ^aA). It retracts A↪H, with no division by a. The zero-dimensional subspace splits separately.

Dependencies: 98.

Proof outline:

1. Let s:Λ^aH→det A retract the determinant inclusion. Send h∈H to the map u↦s(h∧u) on Λ^(a−1)A and then use the inverse of A≅Hom(Λ^(a−1)A,det A).
2. On A this is the identity by wedge evaluation. Every map is equivariant; no factor 1/a occurs. For a=0 use the unique map H→0.

### 98. Exterior powers and induced linear maps already built

**construction; library.** §§4,9,10, exterior-power carrier.

For a commutative ring R and R-modules M,N, the exterior power has its alternating universal property/presentation; f:M→ₗ[R]N induces exteriorPower.map n f:Λ^nM→ₗ[R]Λ^nN. This credits the module construction only, not the determinant splitting or integral representation comparison.

Library: mathlib:exteriorPower.presentation, mathlib:exteriorPower.map.

API:

- `exteriorPower.map_generators` (simp): The exterior map sends v₁∧…∧v_n to f(v₁)∧…∧f(v_n).
- `exteriorPower.ext` (extensionality): Linear maps from an exterior power agreeing on all pure wedges agree everywhere.

Uses:

- CHT §§4,9,10: use the existing alternating carrier

Planning tests:

- Degree0 gives the scalar ring
- Degree1 recovers the module
- A repeated vector has zero wedge

### 99. Invariant splitting suffices for geometric semisimplicity

**theorem; missing.** §10.1 p.231.

By 96–97, it suffices to split invariant inclusions in every exterior power of each H^w(Yx,Fℓ). For ℓ>a the exterior power is a direct factor of H^(wa)(Yx^[a],Fℓ); apply the same invariant-splitting assertion to this smooth proper fibre power. Uniformity over a is finite since a≤rank H^w.

Dependencies: 33, 35, 96, 97.

### 100. Canonical invariant lattice and quotient reduce exactly

**construction; missing.** §10.2 p.231.

Set A∞=Hℓ∞^Π∞ and B∞=Hℓ∞/A∞; A∞ is saturated and B∞ free. Fact 3.1 and Inv identify A∞/ℓ=Aℓ=Hℓ^Πℓ and B∞/ℓ=Bℓ=Hℓ/Aℓ, giving 0→B∞ --ℓ→B∞→Bℓ→0. Keep the canonical reduction diagram and snake connecting map; a dimension count alone does not construct it.

Dependencies: 09, 11, 22.

API:

- `invariantLatticeSequence.quotientFree` (structure): The invariant lattice is saturated, so its quotient in a finite-free Zℓ-lattice is finite free.
- `invariantLatticeSequence.reductionExact` (compatibility): Under Inv and cohomological reduction, reducing the canonical short exact lattice sequence gives exactly the fixed-space inclusion and quotient over Fℓ.

Uses:

- CHT §10.2: construct the mod-ℓ extension to split

Planning tests:

- Trivial action makes the quotient zero
- No rational invariants makes the invariant lattice zero
- Without Inv the reduced lattice can miss residual invariants

### 101. Continuous H¹ class of a representation extension

**construction; planned.** §10.1–10.2 pp.231–232.

For an exact sequence0→A→H→B→0 of finite free continuous G-lattices over a complete DVR R, choose the continuous R-linear section149. The cocycle c_s(g)=g*s*g⁻¹−s, valued in Hom_R(B,A), defines an independent class in the existing explicit H1. It vanishes exactly when an equivariant continuous section exists, and its reduction and fraction-field images are the corresponding extension classes. For profinite G,148 transports it to canonical cohomology.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 143, 147, 148, 149.

Proof outline:

1. The difference g*s*g⁻¹−s lands in A because the induced endomorphism of B is id−id. Joint continuity follows from finite matrix coordinates.
2. With the conjugation action on Hom, c_s(gh)=c_s(g)+g*c_s(h). If s changes to s+i*a, the cocycle changes by δa.
3. If c_s=δa, then s−i*a is an equivariant continuous section. Conversely any equivariant section has zero cocycle.
4. Finite freeness identifies Hom_R(B,A) after reduction or localization with the corresponding Hom of the changed coefficients. The cocycle formula commutes with these coefficient maps.

API:

- `continuousExtensionClass.cocycle` (constructor): The section s defines c_s(g)=g*s*g⁻¹−s in Hom(B,A), a continuous cocycle.
- `continuousExtensionClass.change_section` (compatibility): Replacing s by s+i*a adds the boundary of a.
- `continuousExtensionClass.zero_iff_split` (characterisation): The class vanishes precisely when the extension has a continuous equivariant R-linear section.
- `continuousExtensionClass.baseChange` (functoriality): Reduction modulo π and extension to K carry the class to the class of the changed extension under the finite free Hom comparison.

Uses:

- CHT §10.2: Descend rational splitting through the injective H1 coefficient map151.

Planning tests:

- An equivariantly split extension has zero class
- All choices of section yield the same class
- The C3 unipotent representation [[1,g],[0,1]] over F3 gives a nonsplit extension of trivial modules

### 102. Saturated arithmetic Hom lattice has torsion-free H¹

**theorem; missing.** §10.2 p.232.

In 100, the module A∞⊗B∞∨ embeds as an arithmetic-stable saturated submodule of Hℓ∞⊗Hℓ∞∨. Theorem 1.3(2) and 10 give H¹(Π∞,A∞⊗B∞∨)[ℓ]=0. Arithmetic normality is essential to justify use of Theorem 1.3.

Dependencies: 13, 100, 153, 10.

Proof outline:

1. Item100 gives the invariant submodule A and free quotient B. Normality of the geometric subgroup makes A arithmetic-stable.
2. By153, Hom(B,A) embeds arithmetically and saturatedly in End(H). Apply Theorem1.3(2), item13, at the bounded tensor degree(1,1) to obtain Inv for this lattice.
3. Item10 converts Inv into absence of ℓ-torsion and full Zℓ-torsion-freeness of H1.

### 103. Cohomological proof of geometric semisimplicity

**theorem; missing.** §10.2 p.232.

The extension class101 becomes zero over Qℓ by connected semisimple generic monodromy. By102 its integral H1 group has no ℓ-torsion, and the direct kernel lemma151 makes H1(M)→H1(M⊗Qℓ) injective. Hence the integral extension splits, so does its reduction, and the exterior/determinant reduction99 gives Theorem1.1. Full compact localization152 is available but is not needed for this implication.

Dependencies: 24, 100, 101, 102, 151, 99.

Proof outline:

1. Use rational complete reducibility to obtain a G-equivariant rational section; the extension class is therefore a rational boundary.
2. Clear the single denominator of its Hom-space primitive as in151. Torsion-freeness102 forces its integral class to vanish.
3. Use101 to obtain an integral equivariant section. Reduce it modulo ℓ, then apply99, which already records the finite collection of exterior/tensor tests and their uniform bound.

### 104. Arithmetic semisimplicity and Tate fullness assertions

**definition; planned.** §11 p.232.

For K₀ finitely generated over F_p, smooth proper d-dimensional Y₀/K₀, Y=Y₀×K̄₀ and w≥0, (11.1,Λ,w) asks semisimplicity of Gal(K₀) on H^(2w)(Y,Λ); (11.2,Λ,w) asks surjectivity of Z^w(Y₀)⊗Λ→H^(2w)(Y,Λ(w))^Gal(K₀). Keep Λ=Zℓ,Fℓ,Qℓ separate and do not assert these conjectures.

Existing owner: MotivesAndAlgebraicCycles:MC.7.

API:

- `arithmeticTateAssertions.cycleMap` (data): Expose the cycle-class map in codimension w into arithmetic fixed vectors of H^(2w)(Y,Λ(w)).
- `arithmeticTateAssertions.fullness` (characterisation): Tate fullness is surjectivity of that map for the specified coefficient ring; it is distinct from semisimplicity of the arithmetic representation.

Uses:

- CHT Corollary11.1: retain all conditional hypotheses

Planning tests:

- w=0
- complementary degree d−w retained
- geometric theorem does not discharge arithmetic assumptions

### 105. Conditional arithmetic mod-ℓ semisimplicity

**theorem; missing.** Corollary 11.1, semisimplicity conclusion, p.232.

For 104, assuming (11.1,Qℓ,w) and (11.2,Qℓ,i) for i=w,d−w in the source's rational-coefficient hypothesis, conclude (11.1,Fℓ,w) for all sufficiently large ℓ depending on Y₀. This is conditional and in positive characteristic; it is not an unconditional arithmetic variant of Theorem 1.1.

Dependencies: 107, 108, 109, 110.

### 106. Conditional arithmetic mod-ℓ Tate fullness

**theorem; missing.** Corollary 11.1, fullness conclusion, pp.232–233.

Under the same hypotheses as 105, conclude (11.2,Fℓ,w) for all sufficiently large ℓ. Complementary-codimension Tate fullness d−w is needed for the integral cycle-saturation input and cannot be dropped.

Dependencies: 107, 111.

### 107. Integral cycle saturation from rational Tate hypotheses

**theorem; missing.** CHT §11 p.232; MR04 submitted author version §3 pp.10–11, Lemma3.1 (standing smooth-projective hypothesis on p.10).

For a smooth projective d-dimensional V over a field k finitely generated over its prime field, assume rational Tate fullness in codimensions w and d−w and the isomorphism H^(2w)(Vbar,Qℓ(w))^Gal(k)→H^(2w)(Vbar,Qℓ(w))_Gal(k), for almost all ℓ. Milne–Ramachandran Lemma3.1 gives surjectivity of the integral cycle map onto the integral fixed lattice for almost all ℓ. Rational semisimplicity implies the invariants-to-coinvariants hypothesis. After excluding cohomological torsion primes, the fixed lattice is saturated in all cohomology. CHT §11 uses this conclusion for smooth proper Y₀; carrying the argument from the projective source to that scope remains a stated extraction obligation G7.

Proof outline:

1. Use the cited Tate1994 §2.9 input to identify homological and numerical equivalence in both complementary degrees.
2. Numerical cycle groups modulo torsion are finitely generated and their nondegenerate intersection pairing has a single nonzero integral discriminant D independent of ℓ.
3. Rational fullness makes the integral cycle maps have finite cokernel. Away from D and the cohomological torsion primes, the unimodular pairing on the cycle lattices forces those cokernels to vanish.
4. The numerical-equivalence, finite-generation and proper-versus-projective inputs are not proved by merely quoting the lemma; they remain G1/G7. This argument occurs before the finite extension used to connect monodromy in CHT.

### 108. Finite-field reduction of semisimple Frobenius

**theorem; missing.** §11 finite-field case p.233.

For a rational compatible Frobenius family with a common separable rational minimal polynomial acting on stable lattices, exclude denominator/discriminant primes. The reductions are semisimple of prime-to-ℓ order; the dimension of fixed vectors equals the multiplicity of 1 in the characteristic polynomial. The common separable minimal polynomial is an input to verify, not implied by purity.

### 109. Spreading out and common semisimple Frobenius

**construction; missing.** §11 general-field case p.233, [LP95].

For Y₀ over finitely generated K₀/F_p, spread to a smooth proper family over a smooth geometrically connected finite-field base. After the permitted finite Galois extension giving connected arithmetic monodromy, choose a common closed point with semisimple Frobenius on every rational coefficient realization as supplied by Larsen–Pink. Use 108 for reduction.

API:

- `commonFrobeniusModel.spread` (data): Expose a smooth finite-field base, the smooth proper family and its identification with the original generic fibre after the permitted extension.
- `commonFrobeniusModel.commonPoint` (projection): Expose one closed point with the required semisimple Frobenius for all coefficient realizations, using the precise Larsen–Pink input in G6.

Uses:

- CHT §11: pass from finitely generated fields to one closed-point Frobenius

Planning tests:

- A constant finite-field family has its original Frobenius
- Choosing one point separately for each ℓ does not meet the common-point requirement
- A finite base extension must preserve each required Tate hypothesis

### 110. Arithmetic semisimplicity from geometric subgroup and Frobenius

**theorem; missing.** §11 p.233, [Ser94, Lem.5(b)].

For the finite residual arithmetic image, the geometric image is normal and semisimple by Theorem 1.1, and the arithmetic image is generated by it and the selected Frobenius of order prime to ℓ. Average a geometric-equivariant retraction over that cyclic subgroup to obtain arithmetic semisimplicity.

Dependencies: 03, 108.

### 111. Arithmetic invariant ranks and fullness transfer

**theorem; missing.** §11 p.233, [LP95, Prop.2.1].

In the spread-out setting, arithmetic invariants equal Frobenius-fixed geometric invariants. Theorem 1.3 matches geometric invariant ranks, while the common Frobenius polynomial on geometric invariants and semisimplicity match the 1-eigenspace ranks over Qℓ and Fℓ. Together with 107's cycle-image rank equality this proves 106.

Dependencies: 11, 105, 107.

### 112. Low-degree corestriction-restriction already built

**theorem; library.** Lemma 4.2 and §11, finite-cover descent precursor.

For a topological group G, open finite-index subgroup U and topological coefficient module M under the continuous-cochain hypotheses, the explicit H¹ maps satisfy cor_U^G∘res_U^G=[G:U]·id. This is credited only on Tau Ceti's explicit H¹ carrier; the comparison to canonical continuousCohomology for compact coefficients is still required.

Library: tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1.

### 113. Larsen Nori-dimension bound

**theorem; missing.** Theorem 7.3 proof; Larsen 2010, Theorem 7 pp.1034–1035.

For each n there is A_n such that for prime ℓ>A_n and closed Γ⊂GL_n(Zℓ), with G the Qℓ-Zariski closure, dim N(reduction Γ)≤dimG. The full published proof was read and is decomposed through132–136; Nori and p-adic analytic growth remain recursive inputs in G1.

Dependencies: 132, 135.

### 114. Larsen equality-case bounded index

**theorem; missing.** Theorem 7.3(2) proof; Larsen 2010, Theorem 7(3) p.1035.

In 113, if Nori dimension equals dimG and the radical of G° is unipotent, then [G(Qℓ)∩GL_n(Zℓ):Γ]≤C_n, a constant depending only on n. Connected semisimple G satisfies the radical hypothesis. The equality-case openness and congruence-filtration comparison are prerequisites of this bound.

Dependencies: 136, 137, 138, 139, 140, 141.

### 115. Building and parahoric foundations are imported

**construction; planned.** §8 pp.223–225.

Construct relative roots, valued root data, apartments, the building action, facets and smooth affine parahoric models with their generic fibres, special reductive quotients and congruence kernels. These existing planned foundations feed 72–80; the new extension owns only the precise hyperspecial comparison and monodromy-specific dimension argument.

Existing owner: ReductiveGroupsPartII:RG2.1, ReductiveGroupsPartII:RG2.2, ReductiveGroupsPartII:RG2.3.

API:

- `parahoricFoundations.facetModel` (projection): From the existing valued-root/building data expose the smooth affine parahoric model and its generic identification.
- `parahoricFoundations.reductiveQuotient` (projection): Expose the special fibre unipotent radical and reductive quotient, with the stated congruence-kernel comparison.

Uses:

- CHT §8: import the existing RG2 building and model constructions

Planning tests:

- Standard SL₂ apartment
- An Iwahori facet is not hyperspecial
- The special reductive quotient must not be identified with the whole special fibre

### 116. Uniform weight projectors on arithmetic subquotients

**theorem; missing.** Explicit extraction dévissage for §5.2–5.3 pp.218–219; based on Fact 3.2 and the CRT.

In C choose one rational-point Frobenius and its finitely many degree-w rational polynomials P_w. Their root weights are pairwise disjoint, so after excluding denominators and pairwise resultants the Chinese remainder theorem gives integral polynomials e_w(F) acting on H* exactly as its cohomological-degree projections. Every arithmetic-stable submodule or quotient is stable under F, hence under these projectors, and splits by degree. Saturation/freeness passes to each direct factor. This reduces the total-cohomology assertions in Theorem 4.5 to the single-degree proofs uniformly in the subquotient.

Added proof detail, not a separately numbered source theorem and not an allegation of an error. The e_w(F) commute with π₀ because on H* they equal its canonical degree projectors, not because an arbitrary Frobenius is central.

Dependencies: 23, 41.

Proof outline:

1. Outside the torsion and coefficient-denominator primes, each rational Frobenius polynomial P_w annihilates the degree-w lattice by Cayley–Hamilton and torsion freeness.
2. Disjoint pure weights make the finitely many P_w pairwise coprime over Q. Exclude their pairwise resultants and leading coefficients. CRT then supplies e_w in Zℓ[T] with residues 1 modulo P_w and 0 modulo the other P_v.
3. On total cohomology e_w(F) is exactly the existing degree projector. Thus it commutes with the full arithmetic action even though F need not be central.
4. Every arithmetic-stable submodule or quotient is F-stable and hence e_w(F)-stable. The orthogonal idempotents split it into degree pieces; freeness and saturation pass to these direct summands.
5. The finite excluded set depends on the original degree polynomials, not on the submodule or quotient. This closes the degree-splitting part of G2; the uniform dual/fibre-power assembly remains separately recorded.

### 117. Semisimple group scheme over Zℓ

**definition; planned.** §7.1 p.221.

A semisimple Zℓ-group scheme is smooth affine with connected semisimple geometric fibres. It is simply connected when each geometric fibre is. The fibre root data are constant in the sense used by SGA3 XXII Proposition 2.8; this relative notion is distinct from the built field predicates.

 Upstream Layer8 already reserves relative theory. Request the smooth affine semisimple fibre predicate there; the field-level predicates alone do not implement it.

Existing owner: tauceti:TauCetiRoadmap/ReductiveGroups#layer-8-classification-and-existence-long-horizon.

API:

- `semisimpleIntegralModel.geometricFibres` (characterisation): The model is smooth affine with connected semisimple geometric fibres; fibrewise simply connectedness defines its simply connected variant.
- `semisimpleIntegralModel.baseChange` (compatibility): Base change preserves this relative predicate and the generic/special fibre identifications.

Uses:

- CHT §§7–9: formulate relative semisimplicity

Planning tests:

- split SL₂ model
- G_m is reductive but not semisimple
- nonsmooth special fibre fails the predicate

### 118. Finite-free integral representation category

**definition; missing.** §9.1 p.226.

For an affine flat Zℓ-group scheme 𝒢, Rep^f_Zℓ(𝒢) has finite-free Zℓ-modules M with a morphism of group schemes 𝒢→GL(M), and intertwining Zℓ-linear maps. Construct tensor, dual, exterior powers and generic/special restriction. Do not assume the category is abelian: arbitrary cokernels need not be free.

Dependencies: 70.

API:

- `finiteFreeGroupRepresentation.tensorDual` (constructor): Tensor products and duals of finite-free algebraic representations retain finite freeness and the canonical group actions.
- `finiteFreeGroupRepresentation.baseChange` (functoriality): Extension of scalars commutes with tensor, dual and exterior power on finite-free representations and maps intertwining maps to intertwining maps.

Uses:

- CHT §9.1: form Lie exterior tensors and their fibres

Planning tests:

- trivial rank-one representation
- torsion cokernel is not an object
- tensor and dual commute with base change

### 119. Pure and mixed lisse integral sheaves

**definition; planned.** §2.2 pp.210–211.

For a lisse Zℓ-sheaf on finite-type X₀/Z, purity of weight w means that for every closed point of X₀[1/ℓ] every root of det(T−F_x) is a |k(x)|-Weil number of weight w. Mixed means a finite filtration with pure successive quotients. Rationality means each local polynomial is in Q[T]. Keep integral lattices and their rational realizations distinct, including torsion-freeness when the determinant is formed.

Existing weight owner; no new mixed-sheaf definition at the monodromy extension.

Existing owner: DeligneWeightsAndPurity:DWP.5.

API:

- `mixedLisseSheaf.pointwisePure` (characterisation): Purity tests the weight of every local Frobenius eigenvalue at every eligible closed point and every complex embedding.
- `mixedLisseSheaf.mixedFiltration` (data): A mixed object is supplied with a finite filtration whose successive quotients are pure with their specified weights.

Uses:

- CHT §2.2 and §5: import DWP.5 purity and mixedness

Planning tests:

- A constant rank-one sheaf is pure of weight0
- Tate twist(1) has weight−2
- A pure unipotent Jordan action need not be semisimple

### 120. Finite-support mixed tensor multiplicities

**definition; missing.** CT16 author TI.pdf §4.2 pp.10–11; definition preceding Lemma4.2.1.1.

For a field F, finite-dimensional V and finitely supported f:N²→N, define T^f(V)=⊕_(s,t)(V^⊗s⊗(V∨)^⊗t)^⊕f(s,t), with diagonal GL(V)-action and specified coordinate injections. This adds multiplicity bookkeeping to the existing tensor carrier, not a second tensor product.

Dependencies: 53.

Proof outline:

1. Use finite support to form a finite direct sum of the existing mixed tensor objects.

API:

- `tensorMultiplicity.summand` (constructor): Each support index and copy has its canonical injection and projection.
- `tensorMultiplicity.tensorDegrees` (compatibility): Tensoring two summands adds their covariant and contravariant degrees separately.

Uses:

- CHT extraction items 122–126: Track ranks and tensor bounds uniformly

Planning tests:

- Zero multiplicity map gives the zero representation
- One copy in degree(0,0) is trivial rank1
- Repeating a summand changes rank but not its fixed-vector stabilizer

### 121. Finite-type parameter family for exponential products

**construction; missing.** CT16 §4.2.1 p.11; Larsen Proposition3 pp.1032–1033.

Over Z[1/(r−1)!], form tuples of r² nilpotent r×r matrices and their truncated-exponential product maps. For a fully uniform family one may use the 2r² repetitions of Larsen Proposition3, with 2r⁴ scalar parameters and the constructible locus of tuples spanning a Lie subalgebra. CT16 uses a selected r²-tuple with two repetitions; the two parameter counts must not be identified.

Use the corrected notation in E6–E8: the compactification is K union boundary in projective space; the parameterized Lie algebras are nilpotently generated, not necessarily nilpotent.

Dependencies: 54.

Proof outline:

1. Matrix equations N_i^r=0 and the finite exponential sums define finite-presentation data after factorial inversion.
2. The Lie-closed spanning locus is constructible via bracket structure constants; stratify it. Its relation to exponentially generated groups is the separate Nori input129.
3. Borel product-generation supplies a surjective product map for the permitted tuples; this is a source dependency, not a consequence of finite point counting.

API:

- `exponentialFamily.evaluate` (simp): Evaluation at a nilpotent tuple and parameter tuple is the ordered product of its specified truncated exponentials.
- `exponentialFamily.baseChange` (compatibility): All matrix equations and factorial-denominator coefficients commute with base change from Z[1/(r−1)!].

Uses:

- CHT extraction items 122,130: Supply a finite-type family for stratification

Planning tests:

- All nilpotent matrices zero gives the constant identity map
- Upper/lower root nilpotents in rank2 need both generators
- The 2r² and 2r⁴ parameter counts represent distinct constructions

### 122. Uniform Chevalley subspaces by finite stratification

**theorem; missing.** CT16 Lemma4.2.1.1 proof p.11.

For the finite-type exponential family of121, after excluding finitely many residue characteristics there is a single finite-support multiplicity f°_r such that every required exponential subgroup U⊂GL_r is the setwise stabilizer of a subspace W_U⊂T^(f°_r)(F^r). Equality is required as subgroup schemes after arbitrary coefficient-algebra extension.

Dependencies: 120, 121, 129.

Proof outline:

1. At the generic points apply Chevalley realization of a closed subgroup as a subspace stabilizer in a mixed tensor representation.
2. Spread the finite-dimensional subspace and stabilizer equality to open strata using the cited EGAIV.3 Proposition9.6.1(i).
3. Repeat on the lower-dimensional complements and sum the finitely many multiplicity maps. Finiteness of the parameter scheme, not an individual group, supplies uniformity.
4. G5 requires the precise family/group-scheme and spreading hypotheses; the author text switches to field-point notation, so this stronger interface remains an explicit proof obligation.

### 123. A subspace stabilizer equals its determinant-line stabilizer

**theorem; missing.** CT16 Lemma4.2.1.1 proof p.11; Plücker step.

For finite-dimensional E over F and W⊂E of dimension δ, Stab_GL(E)(W)=Stab_GL(E)(Λ^δW) as group schemes. For every F-algebra A, a point g preserves W_A exactly when its exterior action preserves the rank-one direct summand det(W)_A.

Dependencies: 98.

Proof outline:

1. Choose a basis adapted to W and its direct-sum complement. The stabilizer condition is vanishing of the lower-left matrix block.
2. The Plücker line condition, with an invertible coefficient on its basis wedge, gives the same block equations over every F-algebra. Include δ=0 and δ=dim E.

### 124. Exponentially generated groups have no characters

**theorem; missing.** CT16 Lemma4.2.1.1 p.11; Larsen Proposition1 p.1030.

An algebraic character U→G_m of an exponentially generated group is trivial as a group-scheme morphism. In particular U acts trivially on the determinant line of every finite-dimensional U-stable subspace.

Dependencies: 55.

Proof outline:

1. Restrict the character to each exponential G_a. A Hopf algebra morphism F[z,z⁻¹]→F[t] sends z to a unit, hence to a constant, and its identity value forces that constant to be1.
2. The kernel is a closed subgroup containing every exponential generator, so minimality of the generated group makes it all U. The determinant action is a character.

### 125. Antisymmetrization embeds determinant lines into tensor powers

**theorem; missing.** CT16 Lemma4.2.1.1 last paragraph p.11.

For E of dimension D and δ≤D, if δ! is invertible in F, the antisymmetrization map Λ^δE→E^⊗δ is GL(E)-equivariant and injective. The composite with the wedge quotient is multiplication by δ!. A single bound ℓ>D works for every δ≤D in CT16.

Dependencies: 98.

Proof outline:

1. Alternating the pure tensor factors factors through the exterior universal property.
2. Its wedge projection is δ! on pure wedges. Inverting δ! gives a left inverse; equivariance follows because permutation and diagonal actions commute.

### 126. Multiplicity tensor tests reduce to separate degree bounds

**theorem; missing.** CHT §7.1 Lemma7.1.2 from CT16 Lemma4.2.1.1.

If f has finite support and d bounds both s and t on that support, the pointwise stabilizer of (T^≤d(V))^U is contained in that of (T^f(V))^U. Repeated isomorphic summands add no distinct conditions. For the tensor powers of T^(f°)(V) of orders δ≤D, take d≥D max(s,t) over supp(f°), after expanding every summand.

Dependencies: 120, 53, 127.

Proof outline:

1. Invariants of the finite direct sum are the direct sum of the invariant spaces. Each repeated copy has the same fixed-vector equations.
2. A tensor product adds the two degrees separately. Thus each expanded summand occurs within the specified rectangular bound.
3. Prove equations on all coefficient algebras; no density assertion about U(Fℓ) is used.

### 127. Pointwise tensor-stabilizer subgroup scheme

**definition; missing.** CHT §7.1; CT16 Lemma4.2.1.1.

For an algebraic representation E of GL(V) over F and a vector subspace W⊂E, Fix(W) is the closed subgroup scheme whose A-points fix every w⊗1, w∈W, in E⊗F A, for every F-algebra A. This is distinct from setwise Stab(W).

Dependencies: 53.

Proof outline:

1. Choose a basis of W and impose the matrix-coordinate equations ρ(g)w=w; changing its basis generates the same ideal.

API:

- `pointwiseStabilizer.points_iff` (characterisation): An A-point belongs exactly when it fixes the base changes of all vectors of a chosen F-basis of W.
- `pointwiseStabilizer.basis_independent` (extensionality): Changing the basis of W leaves its defining fixed-vector ideal unchanged.

Uses:

- CHT extraction items 58,126: State tensor equations scheme-theoretically

Planning tests:

- Fixing the zero subspace gives all GL(V)
- Fixing a nonzero line pointwise is stronger than preserving it
- Over dual numbers a scalar 1+ε preserves a line but does not fix its basis vector

### 128. Characteristic-zero criterion for exponential generation

**theorem; missing.** Larsen Proposition2 pp.1030–1031.

Over a characteristic-zero field F, an algebraic subgroup G⊂GL_n is exponentially generated exactly when it has no nontrivial finite, toric or anisotropic quotient.

Dependencies: 54, 55.

Proof outline:

1. Exponential generators cannot map nontrivially to any of the three quotient types.
2. In the converse, the split unipotent radical is generated successively by G_a using the filtration and vanishing H¹ inputs; proper parabolic unipotent radicals generate the remaining isotropic semisimple quotient.
3. Retain the primary structure and rational-point density inputs as G1 leaves, rather than assuming every reductive group is split.

### 129. Nori correspondence for nilpotently generated Lie algebras

**theorem; missing.** Larsen Proposition3 pp.1032–1033 and Theorem7 p.1035, citing Nori TheoremA.

For each n and all sufficiently large characteristics, Lie and exponential generation identify the relevant exponentially generated subgroups of GL_n with Lie subalgebras of gl_n spanned by nilpotent elements. For a finite residual subgroup, the dimension of the span of its order-p logarithms is the dimension of its Nori envelope.

Use the corrected notation in E6–E8: the compactification is K union boundary in projective space; the parameterized Lie algebras are nilpotently generated, not necessarily nilpotent.

Dependencies: 54, 55.

Proof outline:

1. This is the exact Nori TheoremA interface used by Larsen. It is not Nori TheoremB finite-index/plus comparison56.
2. Read the original Nori proof and field hypotheses before marking this input closed.

### 130. Finite set of exponential-group Hilbert polynomials

**theorem; missing.** Larsen Proposition3 pp.1032–1033.

For fixed n there are N and finitely many Hilbert polynomials for the reduced projective sets G∪(P^(n²) minus GL_n) attached to exponentially generated subgroups over fields of characteristic zero or prime not dividing N. The boundary is included; this is not just the projective closure of G.

Use the corrected notation in E6–E8: the compactification is K union boundary in projective space; the parameterized Lie algebras are nilpotently generated, not necessarily nilpotent.

Dependencies: 121, 129, 131.

Proof outline:

1. Use the constructible nilpotent Lie-tuple parameter family and its bounded word map. Add the entire projective boundary.
2. Apply131 to construct reduced fibre images over a finite-type stratification.
3. Flatten projectively over finitely many strata to obtain finitely many Hilbert polynomials; retain the Hilbert/flatness inputs in G1.

### 131. Reduced closed fibre images in a finite-type family

**theorem; missing.** Larsen Lemma4 pp.1033–1034.

For X finite type over Z, Y⊂P^m_X closed and ξ:Z→Y finite type with every fibre image closed, after inverting one integer there is a finite-type stratified cover X′→X and Y′⊂P^m_(X′) whose fibre at an F-rational lift of x is the reduced image ξ(Z_x).

Proof outline:

1. Use noetherian induction and geometric reducedness on a characteristic-zero generic stratum, excluding vertical generic characteristics.
2. Remove the closure B of the constructible-image boundary; the remaining closed image C is used for the family.
3. The printed proof uses B_U as Y′ over an open U chosen disjoint from B; source issue E5 records this. Verify the corrected image family and geometric reducedness/base-change details before using the lemma.

### 132. Nori dimension of a compact matrix group

**definition; missing.** Larsen Definition5 p.1034.

For Π⊂GL_n(F_p), Ndim(Π)=dim N(Π). For a compact subgroup Γ⊂GL_n(Z_p), define Ndim(Γ) using its reduction image. This depends on the chosen lattice representation and is distinct from the dimension of the rational Zariski closure.

Dependencies: 55.

Proof outline:

1. Apply the envelope dimension to the finite reduction image.

API:

- `noriDimension.reduction` (simp): The compact-group value is the envelope dimension of its finite reduction image.
- `noriDimension.plus` (compatibility): Taking the residual plus subgroup does not change the set of order-p generators or the envelope dimension.

Uses:

- CHT extraction items 113,135–141: Compare residual logarithms with compact congruence growth

Planning tests:

- A prime-to-p residual group has Nori dimension0
- One nontrivial additive root subgroup has dimension1
- A one-dimensional torus has rational dimension1 and Nori dimension0

### 133. Congruence filtration of a compact matrix group

**definition; missing.** Larsen Theorem7 proof p.1035.

For closed H⊂GL_n(Z_p) and m≥1, F_mH={h∈H:h≡1 mod p^m}. The map h↦(h−1)/p^m mod p identifies F_mH/F_(m+1)H with an F_p-subspace of M_n(F_p).

Proof outline:

1. The product law modulo p^(m+1) becomes addition; the kernel is F_(m+1). An additive subgroup over the prime field is an F_p-subspace.

API:

- `congruenceFiltration.gradedMap` (projection): The graded map sends 1+p^mA to A modulo p and has kernel the next congruence level.
- `congruenceFiltration.closed` (structure): Each level is a closed normal subgroup, is open in H, and the intersection of all levels is trivial.

Uses:

- CHT extraction items 134–136: Lift logarithms and reconstruct the first congruence kernel

Planning tests:

- For H={1} every graded piece is zero
- For GL_n(Z_p) each positive-level graded piece has dimension n²
- Using level0 does not linearize multiplication

### 134. Powers of a lifted exponential detect its logarithm

**theorem; missing.** Larsen Lemma6 p.1034.

If p≥2n, x∈M_n(F_p) is nilpotent, and A∈GL_n(Z_p) reduces to exp(x), then for every k≥1, A^(p^k)≡1+p^k M mod p^(k+1), where M is any integral lift of x.

Dependencies: 54, 133.

Proof outline:

1. Lift x to an integral nilpotent matrix by lifting a Jordan basis; the congruence depends only on x. Put N=exp(M)−1 and write A=1+N+pB.
2. For 1≤m<p the binomial coefficient is divisible by p, so all words containing pB disappear modulo p². At m=p the only possibly surviving one-B words have i+j=p−1; p≥2n ensures i≥n or j≥n, killing them because N^n=0 for this lift. Terms with two B are divisible by p².
3. Thus A^p≡exp(pM)≡1+pM modulo p². Iteration uses (1+p^kC)^p≡1+p^(k+1)C modulo p^(k+2) for odd p. The n=1,p=2 nilpotent x=0 case is direct.

### 135. Congruence growth bounds Nori dimension

**theorem; missing.** Larsen Theorem7 proof p.1035.

For large p and H=G(Q_p)∩GL_n(Z_p), the graded congruence dimensions are at most dim G. If Γ⊂H is closed, they are at least Ndim Γ on F_mΓ/F_(m+1)Γ for every m≥1. Consequently Ndim Γ≤dim G.

Dependencies: 129, 132, 133, 134.

Proof outline:

1. The pth-power map embeds one graded image in the next. Serre’s compact p-adic analytic growth theorem bounds these nondecreasing dimensions by dim G.
2. Lift residual order-p elements in Γ and apply134; their logarithms span the Nori Lie algebra by129.
3. These give lower and upper bounds inside the same M_n(F_p). The analytic growth theorem is a separate G1 input.

### 136. Equal congruence dimensions imply equal first kernels

**theorem; missing.** Larsen Theorem7(1) proof p.1035.

In135, if Ndim Γ=dim G then F_1Γ=F_1H; hence Γ is open in H and in G(Q_p). Closedness of Γ is essential.

Dependencies: 133, 135.

Proof outline:

1. Each inclusion of graded finite-dimensional spaces has equal dimension and is equality.
2. For h∈F_1H, lift its residue successively through Γ, correcting the error in levels2,3,… . Completeness gives a limit in Γ because Γ is closed.
3. F_1H is open, so containing it gives the asserted openness.

### 137. Large-prime component-group bound

**theorem; missing.** Larsen Theorem7(2) proof pp.1035–1036.

Under the equality hypothesis of136, G/G° has prime-to-p order and a normal abelian subgroup of index bounded only by n. This concerns the finite algebraic component group represented by the compact image.

Dependencies: 136.

Proof outline:

1. Use the cited finite central extension realized in G(Q_p), and apply Jordan’s finite-subgroup theorem.
2. For p−1>n, the irreducibility of the pth cyclotomic polynomial over Q_p excludes order-p matrices in GL_n(Q_p).
3. The finite-extension realization and Jordan input remain exact G1 leaves; do not claim arbitrary infinite group extensions preserve order-p elements.

### 138. Totally ramified extension removes anisotropic quotients

**theorem; missing.** Larsen Theorem7(3) proof p.1036.

For connected G/Q_p with unipotent radical equal to its solvable radical, there is a finite totally ramified F/Q_p such that G_F has no nontrivial anisotropic quotient, while its residue field is still F_p. Then G_F is exponentially generated by128.

Dependencies: 128.

Proof outline:

1. Use the local classification of anisotropic simple factors and split the associated division algebras by a common totally ramified extension of suitable degree.
2. No torus quotient remains by the radical hypothesis; preserve the unchanged residue field for later cardinality comparison. The Kneser/local division-algebra inputs remain G1.

### 139. Uniform component bound for the flat integral closure

**theorem; missing.** Larsen Theorem7(3) proof p.1036.

For the exponential generic group G_F in138, the closure in GL_n,O_F is flat and its special fibre has at most d_n geometric irreducible components, uniformly in G and large p. Its dimension is dim G_F.

Use the corrected notation in E6–E8: the compactification is K union boundary in projective space; the parameterized Lie algebras are nilpotently generated, not necessarily nilpotent.

Dependencies: 130, 138.

Proof outline:

1. Use the finite Hilbert-polynomial list for the generic group union projective boundary.
2. Properness of the relevant Hilbert schemes extends the generic point to O_F. Uniqueness of flat closure identifies the resulting family.
3. Constructibility of the number of geometric components on a finite-type base gives d_n. Intersect with the GL_n open and retain the dimension statement for the flat group model. All Hilbert/EGA inputs are listed in G1.

### 140. Finite-field points of connected algebraic groups

**theorem; missing.** Larsen Theorem7(3) proof pp.1036–1037.

For a smooth connected linear algebraic group K/F_p of dimension d, (p−1)^d≤|K(F_p)|≤(p+1)^d. A finite-type possibly nonreduced group has the same F_p-points as its reduction; the component estimate gives |K(F_p)|≤c(p+1)^d when it has at most c geometric components of dimension d.

Proof outline:

1. For split unipotent groups use the additive filtration; for tori use Frobenius on the character lattice; for semisimple groups use the root-degree product formula.
2. Lang-surjectivity combines the connected radical and reductive quotient. On a rational component with a rational point, translation identifies its rational points with the identity component; empty components contribute zero.
3. These structural/counting inputs are G1 and G8, not supplied by the CFSG carrier roadmap.

### 141. Equal-kernel point counts give uniform compact index

**theorem; missing.** Larsen Theorem7(3) proof p.1037.

If Γ,H have the equal first congruence kernel of136 and the radical hypothesis of138 holds, their finite reductions satisfy |H/F_1H|≤d_n(3/2)^(n²)p^d and |Γ/F_1Γ|≥e_n⁻¹2^(−n²)p^d, with d=Ndim Γ. Thus [H:Γ]≤3^(n²)d_ne_n independently of p and Γ.

Dependencies: 56, 136, 137, 139, 140.

Proof outline:

1. Reduce to G° using137: the compact component quotient is prime to p, so Nori dimension is unchanged.
2. Totally ramified scalar extension keeps residue F_p and GL_n(Z_p)∩F_1GL_n(O_F)=F_1GL_n(Z_p), making the upper reduction bound valid.
3. Use Nori’s finite-points index bound e_n and140 for the lower bound, divide, then cancel the equal first kernels. No dimension equality alone gives this numerical index bound.

### 142. Full-dimensional closed subscheme of an integral variety

**theorem; missing.** CHT Theorem7.3 proof p.222.

If X is an integral finite-type scheme over a field and Z⊂X is closed with dim Z=dim X, then Z=X as schemes. This is the precise final equality step after G_s⊂Nori and equality of dimensions.

Proof outline:

1. A proper closed subset of an irreducible finite-type variety has strictly smaller dimension; hence the support of Z is all X.
2. The radical of its defining ideal is zero. Since X is reduced, the ideal is zero as well. Connected smooth algebraic groups over the perfect field Fℓ are geometrically integral, as needed for the application.

### 143. Explicit continuous H¹ and coefficient maps already built

**construction; library.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For a topological group G and a topological additive commutative G-module M with continuous action, TauCeti.ContCohomology.H1 is the additive quotient of continuous one-cocycles by g↦g·m−m. The carrier and explicitCoeff1 allow nondiscrete coefficients. No discrete topology is imposed on the group or coefficient module by these declarations. Its inherited pointwise topology is not identified with the canonical compact-open cohomology topology.

Library: tauceti:TauCeti.ContCohomology.Z1, tauceti:TauCeti.ContCohomology.H1, tauceti:TauCeti.ContCohomology.H1pi_eq_zero_iff, tauceti:TauCeti.ContCohomology.explicitCoeff1.

Proof outline:

1. Read the actual Z1/H1 and explicitCoeff1 declarations and binders at Tau Ceti f790474. The GroupCohomology comparison elsewhere requires a discrete group; the short-exact-sequence file requires discrete coefficients. Neither supplies the compact comparison.

API:

- `H1pi_eq_zero_iff` (characterisation): The class of a continuous one-cocycle is zero exactly when it lies in B1.
- `explicitCoeff1` (functoriality): A continuous equivariant additive coefficient map induces postcomposition on classes; identity and composition laws hold.
- `explicitCoeff1_mk` (simp): The image of the class of c is represented by the coefficient map composed with c.

Uses:

- CHT §10 and items150–155: Use the built additive carrier for lattice cocycles and coefficient maps.

Planning tests:

- Trivial group has zero H1
- A nonzero homomorphism C3→F3 gives a nonzero class for trivial action
- Z3 coefficients are allowed without a discrete-topology instance

### 144. Topological module homology uses the ordinary image

**theorem; library.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

At the pinned Mathlib, TopModuleCat.ker is the linear kernel with subspace topology and TopModuleCat.coker is the quotient by the linear range, not its closure. Its CategoryWithHomology construction therefore has the ordinary algebraic kernel/image subquotient as underlying module.

Library: mathlib:TopModuleCat.ker, mathlib:TopModuleCat.coker, mathlib:TopModuleCat.isLimitKer, mathlib:TopModuleCat.isColimitCoker.

Proof outline:

1. Read the whole TopModuleCat homology construction, including isLimitKer, isColimitCoker and the comparison of left/right homology after forgetting to ModuleCat. This justifies the algebraic quotient used in148, without claiming a Hausdorff quotient.

### 145. Compact-open currying already built

**construction; library.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For locally compact spaces X,Y and any topological Z, Homeomorph.curry identifies C(X×Y,Z) with C(X,C(Y,Z)), with compact-open topologies. Repeated currying flattens the canonical nested continuous coinduction when G is profinite.

Library: mathlib:ContinuousMap.curry, mathlib:ContinuousMap.uncurry, mathlib:Homeomorph.curry.

Proof outline:

1. Read ContinuousMap.curry, uncurry and Homeomorph.curry with their locally compact hypotheses. Apply only to finite products of the profinite group.

API:

- `ContinuousMap.curry_apply` (simp): For f:C(X×Y,Z), f.curry x y=f(x,y).
- `Homeomorph.curry` (equivalence): If X,Y are locally compact, currying and uncurrying are inverse continuous maps for the compact-open topology.

Uses:

- Item148: Flatten the nested canonical cochains in degrees0,1,2 before comparing cocycles.

Planning tests:

- Currying followed by uncurrying fixes a function
- Constant functions are preserved
- The uncurrying continuity hypothesis is retained for a nondiscrete profinite group

### 146. Nonempty finite inverse systems have a section

**theorem; library.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For a directed preorder J and F:Jᵒᵖ→Type with every F(j) finite and nonempty, F.sections is nonempty. Transition maps need not be surjective.

Library: mathlib:nonempty_sections_of_finite_inverse_system.

Proof outline:

1. Read nonempty_sections_of_finite_inverse_system and its cofiltered-system generalization at the Mathlib pin. Apply to finite sets of primitives, cocycle representatives and lift classes, not to an unproved general derived inverse limit.

### 147. Scalar structure on the existing explicit H¹ quotient

**construction; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

Let R be a commutative topological ring, M a topological R-module and G a topological group acting continuously by R-linear maps. The existing additive H1 carrier143 acquires an R-module structure by r[c]=[g↦r c(g)]. Every continuous R-linear equivariant coefficient map induces an R-linear map.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 143.

Proof outline:

1. Pointwise multiplication by each fixed r preserves continuity and the cocycle equation because the G-action is R-linear.
2. It preserves boundaries since r(gm−m)=g(rm)−rm. Descend scalars through the existing additive quotient, prove module identities on representatives, and upgrade explicitCoeff1. Do not introduce a new underlying H1 type.

API:

- `explicitH1Module.smul_mk` (simp): r times the class of c is represented by g↦r*c(g).
- `explicitCoeff1Linear` (functoriality): A continuous R-linear equivariant coefficient map induces an R-linear map on the existing H1 quotient, respecting identity and composition.
- `explicitH1Module.compat_add` (compatibility): The induced R-module addition and zero are the existing additive quotient operations.

Uses:

- Items150–152: Define uniformizer torsion and localization on the shared cohomology carrier.
- Item101: Compare extension classes after scalar change.

Planning tests:

- Scalar multiplication sends a boundary to the boundary of the scaled primitive
- For trivial action H1 agrees with continuous additive homomorphisms and their scalar action
- Over F3 with trivial C3 action, the class of g↦g is nonzero and killed by3

### 148. Underlying linear comparison of canonical and explicit H¹

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For profinite G, a commutative topological ring R and a topological R-module M with jointly continuous R-linear G-action, the underlying R-module of continuousCohomology 1 (TopRep of M) is naturally R-linearly equivalent to143 equipped with147. Naturality includes continuous equivariant coefficient maps and continuous group homomorphisms. No topological isomorphism with the inherited pointwise quotient topology, or with DiscreteH1, is asserted.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 20, 143, 144, 145, 147.

Proof outline:

1. Use145 to flatten the nested continuous coinduced objects of the canonical resolution in degrees0,1,2. Their invariant elements are jointly continuous homogeneous equivariant functions on G,G²,G³. The coefficient action is jointly continuous by hypothesis.
2. A one-cocycle c corresponds to F(g0,g1)=g0·c(g0⁻¹g1); the inverse is c(g)=F(1,g). These are inverse R-linear maps on equivariant one-cochains.
3. The homogeneous differential F(g1,g2)−F(g0,g2)+F(g0,g1), evaluated at (1,g,gh), is g·c(h)−c(gh)+c(g), the inhomogeneous cocycle equation.
4. A degree-zero invariant homogeneous function is g↦g·m. Its differential evaluated at (1,g) is g·m−m. Thus cycles and boundaries match, including the sign convention.
5. Use144 to descend the equivalence to the ordinary algebraic quotient. Postcomposition and restriction commute with the formulas, giving naturality. This is a mathematical proof outline awaiting typed implementation.

### 149. Continuous linear sections of finite free lattice quotients

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

Let R be a complete discrete valuation ring with uniformizer π and fraction field K. For an exact sequence0→A→H→B→0 of finite free R-modules with their π-adic topologies, H→B has an R-linear continuous section. Its formation need not be natural or G-equivariant. Finite free Hom modules have their π-adic topology and the conjugation action of continuous lattice representations is jointly continuous.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Proof outline:

1. Choose an R-basis of B and lift its finitely many elements to H. Linear extension is a section.
2. In finite bases every R-linear map is a finite matrix, hence continuous for the π-adic topology. The resulting H≃A⊕B and its inverse are continuous.
3. The Hom action is matrix multiplication by the continuous representation matrices and their inverses, so is jointly continuous. This verifies the topological assumption needed to construct101.

### 150. Invariant lifting obstruction in continuous H¹

**construction; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For a complete DVR R, uniformizer π, finite free continuous G-lattice M with its π-adic topology, there is a natural exact sequence0→M^G/πM^G→(M/πM)^G→H1(G,M)[π]→0 of R-modules. On an invariant residue class m̄ choose a lift m and send it to [g↦(g·m−m)/π]. This does not require compactness of G.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 143, 147.

Proof outline:

1. Multiplication by π identifies M homeomorphically with πM in the subspace topology, by finite lattice coordinates. The numerator lies in πM and is continuous, so division defines a continuous cocycle.
2. Changing m by πa adds the boundary g↦g·a−a; multiplication of the class by π is the boundary of m. The construction is linear and natural.
3. If an invariant m is in πM, cancellation of π shows m/π is invariant, giving the injection at the left.
4. The connecting class is zero precisely when (gm−m)/π=ga−a for some a∈M. Then m−πa is an invariant lift; this identifies the kernel.
5. Conversely π[c]=0 gives πc(g)=gm−m for one m∈M. Its residue is invariant and the constructed class is [c]. This proves surjectivity onto π-torsion without invoking a compact-coefficient long exact sequence.

API:

- `invariantReductionDelta.apply_lift` (constructor): An invariant residue represented by m maps to the class of g↦(g*m−m)/π.
- `invariantReductionDelta.change_lift` (compatibility): Replacing m by m+π*a adds the boundary of a and preserves the class.
- `invariantReductionDelta.exact` (relation): The kernel consists exactly of reductions of integral invariants and the image is H1[π].
- `invariantReductionDelta.natural` (functoriality): Continuous equivariant R-linear coefficient maps commute with this connecting map.

Uses:

- CHT §1.3 and item10: Equate invariant lifting with absence of π-torsion.
- CHT §10 and item102: Control the Hom-lattice extension obstruction.

Planning tests:

- A trivial action has surjective invariant reduction and zero connecting map
- C3 acting on Z3² by [[0,−1],[1,−1]] has zero integral invariants and a one-dimensional residual invariant space mapping bijectively to H1≃F3
- Changing a lift by3a changes the connecting cocycle by the boundary of a

### 151. Rationalization kernel is exactly lattice torsion

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For a complete DVR R with fraction field K=R[1/π], a finite free continuous G-lattice M and V=M⊗R K with its usual finite-dimensional K-topology, ker(H1(G,M)→H1(G,V)) is exactly the π-primary torsion. Thus this coefficient map is injective whenever H1(G,M)[π]=0. Compactness of G is not needed.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 143, 147.

Proof outline:

1. If a lattice cocycle c becomes a rational boundary, write c(g)=g·v−v for one v∈V. Clear a common denominator π^n v=m∈M, giving π^n c(g)=g·m−m and hence π^n[c]=0.
2. Conversely, from π^n[c]=0 choose m with π^n c=δm. Then c=δ(m/π^n) in V, so its rational class vanishes.
3. If H1[π]=0, induction on n makes multiplication by π^n injective. Every nonzero scalar of the DVR is a unit times π^n; this also proves torsion-freeness from absence of π-torsion.

### 152. Compact-group H¹ commutes with lattice localization

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

Under151, if G is compact, the coefficient map induces an isomorphism H1(G,M)⊗R K≃H1(G,V) of underlying K-modules. Compactness is used for surjectivity; the kernel statement151 holds without it. The assertion makes no claim about tensor-product or quotient topologies.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 151, 147.

Proof outline:

1. The open increasing lattices π^−n M cover V. A continuous cocycle from compact G has compact image, so a finite subcover places its image in one π^−n M. Multiplying by π^n yields a continuous M-valued cocycle (use the subspace topology), proving surjectivity from localization.
2. Every localized class has one denominator. If its image is zero, its numerator class lies in the torsion kernel151 and vanishes after localization.
3. The compactness boundary is real: for the discrete group Z[1/ℓ] with trivial action, Hom(G,Zℓ)=0 because the image of1 would be divisible by every ℓ^n, but the inclusion G→Qℓ is a nonzero continuous homomorphism with unbounded denominators. The localization comparison is not surjective there.

### 153. The extension Hom lattice is a saturated equivariant block

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For an exact sequence of finite free R-lattices0→A→H→B→0 with continuous action by an ambient group Γ, the canonical map Hom_R(B,A)→End_R(H), f↦i∘f∘p, is Γ-equivariant, injective and has finite free cokernel. In particular it is saturated. If A=H^Π for a normal subgroup Π⊲Γ, then A is Γ-stable; if B=H/A is free, this applies to the geometric invariant extension.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 149.

Proof outline:

1. Choose the R-linear section149 only to identify H=A⊕B. The displayed canonical map is the upper-right matrix block. The other three blocks form a finite free complement, establishing saturation independently of the section choice.
2. Equivariance follows directly from equivariance of i and p; no equivariant section is assumed.
3. For a∈H^Π, γ∈Γ and h∈Π, h(γa)=γ(γ⁻¹hγ)a=γa by normality. The quotient and Hom action are consequently ambient-group representations.

### 154. Continuous H¹ of a tower of finite coefficients

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

Let M_n be an inverse sequence of finite discrete abelian G-modules with continuous actions and equivariant transition maps, and let M=lim_n M_n with its inverse-limit topology and action. Then the coefficient maps give an additive isomorphism H1_cont(G,M)≃lim_n H1_cont(G,M_n). No surjectivity assumption on transitions or finiteness assumption on the whole groups H1(G,M_n) is required. This is a degree-one statement, not an all-degree derived-limit comparison.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 143, 146.

Proof outline:

1. For injectivity, if every projection c_n of c is a boundary, the sets P_n={m_n:δm_n=c_n} are finite and nonempty. The module transitions map P_(n+1) to P_n. By146 choose compatible primitives; their inverse-limit element makes c a boundary.
2. For surjectivity, a compatible sequence of classes α_n has sets Z_n of continuous cocycle representatives. Each Z_n is nonempty and finite: after choosing one representative all others differ by a boundary, and B1 is the image of the finite group M_n. The entire H1 group need not be finite.
3. Transitions send Z_(n+1) to Z_n. Apply146 to choose compatible cocycles. Their pointwise inverse limit is a cocycle and is continuous because every finite coordinate is continuous. It represents the desired compatible sequence of classes.
4. The comparison is additive by construction; bijectivity gives the inverse additive map. Coefficient naturality follows from the projected formulas. Completeness gives M≃lim M/π^nM for a finite free lattice over a complete DVR with finite residue field.

### 155. Conditional H¹ surjectivity for a lattice quotient

**theorem; planned.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

Let R be a complete DVR with finite residue field of characteristic ℓ, G profinite, and0→A→H→B→0 an exact sequence of finite free continuous R-lattices. If, for every n≥1, H2_cont(G,A/π^n A)=0 and H1_cont(G,A/π^n A) is finite, then H1_cont(G,H)→H1_cont(G,B) is surjective. Finite-level cohomology uses discrete coefficients; the conclusion uses lattice coefficients. The vanishing hypothesis is on Tau Ceti’s explicit discrete H2 carrier. A geometric cd assertion on another model must first be transported through the upstream discrete comparison; that interface is part of the remaining geometric application gap.

Refines the existing R02.1 compact-coefficient/comparison scope. This is a requested interface of that owner, not a second cohomology theory or an implemented declaration.

Existing owner: ArithmeticGaloisDuality:R02.1.

Dependencies: 149, 146, 154, 148, 156.

Proof outline:

1. The linear splitting149 makes reduction modulo π^n exact. For each n the discrete-coefficient long exact sequence gives surjectivity on H1 by the H2 vanishing hypothesis. This uses the existing ProfiniteCohomology Layer5 discrete interface.
2. Given a compatible system of classes in H1(G,B/π^n), let L_n be its nonempty fibre of lifts in H1(G,H/π^n). Exactness shows this fibre is a torsor for a quotient of H1(G,A/π^n), hence finite.
3. Transition maps preserve L_n, though they need not be surjective. Apply146 to choose compatible lift classes and154 to identify them with a lattice class.
4. For CHT §5.2 the remaining geometric inputs are affine-curve cdℓ≤1, finiteness of finite-coefficient H1 and the group/sheaf comparison. The present conditional lemma does not establish those inputs.

### 156. Discrete coefficient H¹ exactness already built

**theorem; library.** CHT §1.3 p.208, §5.2 pp.218–219 and §10 pp.230–232; direct coefficient proof supplied in this continuation.

For a discrete short exact sequence of continuous G-modules0→A→B→C→0, the range of H1(A)→H1(B) equals the kernel of H1(B)→H1(C), and the range of H1(B)→H1(C) equals the kernel of the explicit connecting map to H2(A). Here G is a topological group, all three coefficients are discrete, and H1/H2 are Tau Ceti explicit continuous carriers.

Library: tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1B, tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitLongExact_H1C.

Dependencies: 143.

Proof outline:

1. Read DiscreteShortExact.explicitLongExact_H1B and explicitLongExact_H1C with all section binders in LongExact.lean at f790474. The latter requires ContinuousMul G, which holds for our topological groups. Apply only to the finite reductions in155.

## Recursive sources

- [O. Gabber, Sur la torsion dans la cohomologie ℓ-adique d'une variété (1983); J. Suh, Symmetry and parity in Frobenius action on cohomology (2012), Theorem1.4](https://doi.org/10.1112/S0010437X11007056): Uniform integral torsion-freeness for smooth proper, including nonprojective, fibres; ordinary rational purity is not this statement. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [A. Cadoret and A. Tamagawa, On the geometric image of Fℓ-linear representations of étale fundamental groups, IMRN 2019, 2735–2762 (the paper's CT13 preprint)](https://doi.org/10.1093/imrn/rnx193): One finite cover giving perfect and order-ℓ-generated residual images, uniformly in ℓ. Later publication identified from the publisher; not a correction to CHT. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [A. Cadoret and A. Tamagawa, Genus of abstract modular curves with level-ℓ structures, CT16](https://doi.org/10.1515/crelle-2016-0057): Lemma4.1's bounded mixed-tensor pointwise-stabilizer theorem and Fact3.4's uniform-image interface. Author-version tensor lemma read and decomposed as120–127. Generic family/Chevalley/spreading hypotheses and the separate Fact3.4 use remain G1/G5.
- [A. Cadoret and A. Tamagawa, A uniform open image theorem for ℓ-adic representations I (2012), Theorem5.7](https://doi.org/10.1215/00127094-1812954): Finite abelianization/determinant argument used in §5.3; verify the exact compact-image assumptions. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [M. V. Nori, On subgroups of GL_n(F_p), Invent. Math.88 (1987), TheoremB and Lemma3.5](https://doi.org/10.1007/BF01388909): Exponential envelope and plus equality, algebraic generation and the group-order estimate needed in Lemma8.1. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [M. Larsen, Exponential generation and largeness for compact p-adic Lie groups (2010), Theorem7](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf): Full proof read; explicit extraction128–141 retains the unipotent-radical assumption, unchanged residue field, analytic-growth and Nori inputs. Lemma4 proof notation is corrected by confirmed E5; E6–E8 correct further notation. No unread remainder of Larsen2010 remains. Its recursively cited Nori, Borel, EGA/Hilbert, Serre, Kneser and finite-field group-count inputs are not closed.
- [J. C. Jantzen, Low-dimensional representations of reductive groups are semisimple (1997), Proposition3.2; M. Larsen, On the semisimplicity of low-dimensional representations of semisimple groups in characteristic p (1995)](https://doi.org/10.1006/jabr.1995.1085): Dimension-uniform large-characteristic complete reducibility for Corollary7.5 and exterior-adjoint calculations; not Maschke. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [M. Larsen and R. Pink, On ℓ-independence of algebraic monodromy groups (1992), Proposition7.2; Abelian varieties, ℓ-adic representations, and ℓ-independence (1995), Propositions1.3 and2.1](https://doi.org/10.1007/BF01444508): Connectedness covers, Γ-regular common Frobenius tori, integral splitting and compatible invariant-space Frobenius polynomials. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [Y. Bazlov, Graded multiplicities in the exterior algebra (2001), §0; Carter, Simple Groups of Lie Type (1972), Proposition10.2.5; Steinberg, Lectures on Chevalley Groups (1968), §12 Theorem41](https://doi.org/10.1006/aima.2000.1969): Exterior-adjoint invariant Poincaré polynomial, exponent table and transfer to sufficiently large characteristic; a generic root-system carrier does not supply this invariant theorem. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [J. S. Milne and N. Ramachandran, Integral motives and special values of zeta functions (2004), Lemma3.1](https://doi.org/10.1090/S0894-0347-04-00458-8): Lemma3.1 read directly; exact projective statement, almost-all-ℓ scope and pairing proof recorded in107. Proper-scheme and recursive pairing inputs remain G1/G7. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [S. Lang, Algebraic groups over finite fields (1956); J. Tits, Algebraic and abstract simple groups (1964); Steinberg, Endomorphisms of Linear Algebraic Groups (1968)](https://doi.org/10.2307/1970394): Lang-surjectivity, plus-generation and finite Lie-type nonabelian factors in §§7–8. Import existing group carriers; generic simplicity/classification is not assumed from CFSGStatement. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [J. Tits, Reductive groups over local fields (1979), §3.8; F. Bruhat and J. Tits, Groupes réductifs sur un corps local II (1984), 1.2.6,2.2.3; B. Conrad, Reductive group schemes (2014), Proposition3.1.3](https://www.numdam.org/item/PMIHES_1984__60__5_0/): Existing RG2 owns building/parahoric foundations, but verify the exact hyperspecial, big-cell/base-change and connectedness interfaces used here rather than proposing a second building roadmap. The exact input has not been found fully planned/proved at theorem granularity; these are prerequisite verification/extraction requests, not requests to duplicate generic foundations.
- [Borel, Linear Algebraic Groups, I Proposition2.2 and II Theorem5.1; EGAIV.3 Proposition9.6.1(i); Larsen–Pink2011 Proposition2.3(b)](https://webusers.imj-prg.fr/~anna.cadoret/TI.pdf): Primary CT16 p.11 explicitly uses bounded products, Chevalley stabilizers and spreading to obtain uniformity; verify the exact subgroup-scheme family hypotheses. Precise external leaves for122/G5; the linked source is the citing proof, not a claim that the original references were read.
- [Serre1981 Theorem8; Kneser1965; EGAIV.2 §2.8.5/§4.6.1 and EGAIV.3 §9.7.7/§9.7.9; Hilbert-scheme properness](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf): Analytic growth135, anisotropic quotient splitting138, and reduced/flat projective families131/139 in Larsen2010. Exact recursive proof inputs extracted from the fully read Larsen paper; original referenced proofs not read in this continuation.

## Reproducible finite diagnostics

### Program 1

```python
"""Exact finite regression examples for the proposed compact H1 interfaces.
No cohomological comparison theorem or infinite-limit theorem is proved here.
"""
from collections import Counter
from fractions import Fraction as Q
from itertools import product
import json

counts = Counter()
def check(condition, group):
    assert condition, group
    counts[group] += 1

T = ((0, -1), (1, -1))
I = ((1, 0), (0, 1))
def mv(a, v):
    return tuple(sum(a[i][j]*v[j] for j in range(2)) for i in range(2))
def mm(a, b):
    return tuple(tuple(sum(a[i][k]*b[k][j] for k in range(2)) for j in range(2)) for i in range(2))
def sub(a,b): return tuple(x-y for x,y in zip(a,b))
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mod(v,q): return tuple(x%q for x in v)
TP = (I,T,mm(T,T))
D = ((-1,-1),(1,-2))
DI = ((Q(-2,3),Q(1,3)),(Q(-1,3),Q(-1,3)))
check(mm(TP[2],T)==I,'integralMatrixIdentities')
check(all(sum(a[i][j] for a in TP)==0 for i in range(2) for j in range(2)), 'integralMatrixIdentities')
check(mm(D,DI)==I,'integralMatrixIdentities')

# H1(C3,M)=ker(1+T+T^2)/(T-1)M; the norm is zero here.
# This checks the nonsaturated boundary lattice and rational primitives.
previous = None
for k in range(1,5):
    q = 3**k
    V = list(product(range(q),repeat=2))
    boundaries = {mod(mv(D,v),q) for v in V}
    invariants = [v for v in V if mod(mv(D,v),q)==(0,0)]
    check(len(V)==3*len(boundaries),'cyclicQuotientOrders')
    check(len(invariants)==3,'cyclicQuotientOrders')
    reps={}
    for v in V:
        # (x+y) mod 3 is the quotient map because it kills both columns of D.
        cls=sum(v)%3
        check((v in boundaries)==(cls==0),'boundaryMembership')
        check(mod(tuple(3*x for x in v),q) in boundaries,'torsionKilledByThree')
        rational=mv(DI,v)
        check(mv(D,rational)==v and all((3*x).denominator==1 for x in rational),'rationalPrimitives')
        reps.setdefault(cls,v)
    check(len(reps)==3,'cyclicQuotientOrders')
    if previous:
        check({sum(mod(v,q//3))%3 for v in reps.values()}=={0,1,2},'towerTransitions')
    previous=reps

# Connecting homomorphism: lift an invariant mod 3 and divide its boundary by 3.
inv3=[v for v in product(range(3),repeat=2) if mod(mv(D,v),3)==(0,0)]
classes=set()
for m in inv3:
    dm=mv(D,m)
    check(all(x%3==0 for x in dm),'invariantConnectingMap')
    c=tuple(x//3 for x in dm)
    check(tuple(3*x for x in c)==dm,'invariantConnectingMap')
    classes.add(sum(c)%3)
    for a in product(range(3),repeat=2):
        lift=add(m,tuple(3*x for x in a))
        changed=tuple(x//3 for x in mv(D,lift))
        check(sub(changed,c)==mv(D,a),'changeOfLift')
check(classes=={0,1,2},'invariantConnectingMap')

# All 729 one-cochains C3 -> F3^2, including noncocycles.
V=list(product(range(3),repeat=2))
def act(g,v): return mod(mv(TP[g%3],v),3)
for c in product(V,repeat=3):
    def F(a,b): return act(a,c[(b-a)%3])
    for g in range(3):
        check(F(0,g)==c[g],'cochainInverse')
    is_cocycle=True
    for a,b,h in product(range(3),repeat=3):
        check(F((a+h)%3,(b+h)%3)==act(h,F(a,b)),'homogeneousEquivariance')
        dF=mod(add(sub(F(b,h),F(a,h)),F(a,b)),3)
        x,y=(b-a)%3,(h-b)%3
        dc=mod(add(sub(act(x,c[y]),c[(x+y)%3]),c[x]),3)
        check(dF==act(a,dc),'differentialComparison')
        if dc!=(0,0): is_cocycle=False
    if is_cocycle:
        check(c[0]==(0,0) and c[2]==mod(add(c[1],act(1,c[1])),3),'cocycleCoordinates')
for m in V:
    c=tuple(mod(sub(act(g,m),m),3) for g in range(3))
    for a,b in product(range(3),repeat=2):
        check(mod(sub(act(b,m),act(a,m)),3)==act(a,c[(b-a)%3]),'boundaryComparison')

# Nontrivial unipotent extension of trivial F3-representations for C3.
# Every section is s_u(b)=(u*b,b), and every extension cocycle is g -> g.
for u,g,h,b in product(range(3),repeat=4):
    section=(u*b%3,b)
    moved=((section[0]+g*section[1])%3,section[1])
    cocycle=(moved[0]-section[0])%3
    check(cocycle==g*b%3,'extensionSection')
    check(((g+h)%3)*b%3==(g*b+h*b)%3,'extensionCocycle')
check(all(g%3==0 for g in [0]) and any(g%3!=0 for g in range(3)),'nonsplitExtension')

# Hom(B,A) is the upper-right matrix block. Arbitrary upper triangular
# changes preserving A carry that block to itself, with the Hom action a*f/d.
for q in [3,9]:
    units=[a for a in range(q) if a%3]
    for a,d,b,f in product(units,units,range(q),range(q)):
        g=((a,b),(0,d));ai=pow(a,-1,q);di=pow(d,-1,q)
        gi=((ai,(-ai*b*di)%q),(0,di));block=((0,f),(0,0))
        conj=mm(mm(g,block),gi)
        check(tuple(tuple(x%q for x in row) for row in conj)==((0,a*f*di%q),(0,0)),'homBlockEquivariance')

counts['scope']='Finite cocycle, torsion, denominator, section and block regressions only; no infinite topological comparison or geometric theorem is established by enumeration.'
print(json.dumps(counts,indent=2))
```

### Program 2

```python
"""Exact finite regressions. These are not proofs of the uniform group theorems."""
from itertools import product
from math import factorial
import json
from pathlib import Path
P=Path('.')
def mul(a,b,q):
 return tuple(sum(a[2*i+k]*b[2*k+j] for k in range(2))%q for i in range(2) for j in range(2))
def power(a,n,q):
 b=(1,0,0,1)
 while n:
  if n%2:b=mul(b,a,q)
  a=mul(a,a,q);n//=2
 return b
I=(1,0,0,1)
counts={'liftedExponentialCongruences':0,'gradedPowerCongruences':0,'tensorDegreeExpansions':0,'finitePointSchemeCounterexamples':0,'determinantLineStabilizers':0}
for p in [5,7]:
 for x in [(0,0,0,0),(0,1,0,0),(0,0,1,0)]:
  for b in product(range(p),repeat=4):
   a=tuple(I[j]+x[j]+p*b[j] for j in range(4))
   for k in [1,2]:
    q=p**(k+1)
    assert power(a,p**k,q)==tuple((I[j]+p**k*x[j])%q for j in range(4))
    counts['liftedExponentialCongruences']+=1
 for c in product(range(p),repeat=4):
  for m in [1,2]:
   q=p**(m+2);a=tuple(I[j]+p**m*c[j] for j in range(4))
   assert power(a,p,q)==tuple((I[j]+p**(m+1)*c[j])%q for j in range(4))
   counts['gradedPowerCongruences']+=1
# A real failure outside the stated p>=2n bound (n=2,p=3).
assert power((1,1,3,1),3,9)!=(1,3,0,1)
counts['smallPrimeCounterexample']=1
# Expanding mixed tensor products adds covariant/contravariant degrees separately.
for support in [((0,0),(1,0)),((1,0),(0,1)),((2,1),(0,2)),((2,2),(1,0))]:
 for r in [1,2,3]:
  D=sum(r**(s+t) for s,t in support)
  d=D*max(max(z) for z in support)
  for delta in range(1,min(D,5)+1):
   for terms in product(support,repeat=delta):
    s=sum(z[0] for z in terms);t=sum(z[1] for z in terms)
    assert s<=d and t<=d
    assert (s+t)*(r-1)<=2*d*(r-1)
    counts['tensorDegreeExpansions']+=1
assert max(sum(z) for z in [(2,2)])==4 # total-degree cutoff2 would lose this summand.
# X^p-X vanishes at all F_p points but is a nonzero polynomial;
# at epsilon over dual numbers it is -epsilon, so it does not vanish schematically.
for p in [2,3,5,7,11]:
 assert all((pow(a,p,p)-a)%p==0 for a in range(p))
 coeff=[0]*(p+1);coeff[1]=-1;coeff[p]=1
 assert any(a%p for a in coeff) and (-1)%p!=0
 counts['finitePointSchemeCounterexamples']+=1
# For W=<e1>, invertible 2x2 matrices stabilize W iff the lower-left entry is0.
# The line and its determinant are the same here; pointwise fixing also requires a=1.
for p in [3,5,7]:
 seen_strict=False
 for a,b,c,e in product(range(p),repeat=4):
  if (a*e-b*c)%p==0:continue
  setwise=c==0;pointwise=c==0 and a==1
  assert not pointwise or setwise
  if setwise and not pointwise:seen_strict=True
  counts['determinantLineStabilizers']+=1
 assert seen_strict
# Normalized antisymmetrization requires factorial invertibility; no claim that
# unnormalized exterior embedding itself must fail in small characteristic.
assert factorial(3)%3==0 and factorial(3)%5!=0
counts['factorialNormalizationBoundary']=1
counts['scope']='Finite rank-two congruences, tensor bounds and explicit counterexamples only; no Chevalley spreading, Nori theorem, Hilbert family or geometric semisimplicity proved.'
(P/'diagnostic-results.json').write_text(json.dumps(counts,indent=2)+'\n')
print(json.dumps(counts,indent=2))
```

### Program 3

```python
"""Exact finite checks for CHT17 extraction; not geometric proofs."""
from itertools import combinations
from math import factorial

def mulpoly(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i+j] += x*y
    return out

types = []
for n in range(1, 7):
    types.append(("A"+str(n), list(range(1, n+1))))
    if n >= 2:
        types.append(("B"+str(n), list(range(1, 2*n, 2))))
        types.append(("C"+str(n), list(range(1, 2*n, 2))))
    if n >= 4:
        types.append(("D"+str(n), list(range(1, 2*n-2, 2))+[n-1]))
types += [("G2", [1,5]), ("F4", [1,5,7,11]), ("E6", [1,4,5,7,8,11])]
systems = []
def enumerate_systems(start=0, names=(), exponents=()):
    if exponents:
        poly = [1]
        for e in exponents:
            poly = mulpoly(poly, [1]+[0]*(2*e)+[1])
        assert sum(poly) == 2**len(exponents)
        assert len(poly)-1 == sum(2*e+1 for e in exponents)
        systems.append((names, len(exponents), len(poly)-1, poly))
    for i in range(start, len(types)):
        name, es = types[i]
        if len(exponents)+len(es) <= 6:
            enumerate_systems(i, names+(name,), exponents+tuple(es))
enumerate_systems()
witnesses = 0
for a in systems:
    for b in systems:
        if a[1] == b[1] and a[2] < b[2]:
            assert any(a[3][m] > b[3][m] for m in range(a[2]+1))
            witnesses += 1

def ident(r):
    return [[int(i == j) for j in range(r)] for i in range(r)]
def mm(a, b, p):
    r = len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(r)) % p
             for j in range(r)] for i in range(r)]
def add(a, b, p):
    return [[(x+y) % p for x,y in zip(ar,br)] for ar,br in zip(a,b)]
def scale(c, a, p):
    return [[c*x % p for x in row] for row in a]
def expm(a, p):
    r, out, term = len(a), ident(len(a)), ident(len(a))
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale(pow(factorial(n), -1, p), term, p), p)
    return out
def logm(u, p):
    r = len(u)
    a = add(u, scale(-1, ident(r), p), p)
    out, term = scale(0, a, p), ident(r)
    for n in range(1, r):
        term = mm(term, a, p)
        out = add(out, scale((-1)**(n+1)*pow(n, -1, p), term, p), p)
    return out
group_laws = 0
for p in (5,7,11,17):
    for r in (2,3,4):
        for seed in (1,2,3):
            a = [[(seed+i+2*j) % p if i < j else 0
                  for j in range(r)] for i in range(r)]
            u = expm(a,p)
            assert logm(u,p) == a
            values = [expm(scale(t,a,p),p) for t in range(p)]
            for t in range(p):
                for v in range(p):
                    assert mm(values[t],values[v],p) == values[(t+v)%p]
                    group_laws += 1
            # Strict polynomial degree < p matters in Lemma 7.1(3).
            assert all((t**p-t) % p == 0 for t in range(p))
            assert [0,(-1)%p]+[0]*(p-2)+[1] != [0]*(p+1)

splittings = 0
for p in (2,3,5,7):
    for r in range(1,7):
        for a in range(1,r+1):
            top = tuple(range(a))
            coefficients = {I:(sum((k+1)*(j+1) for k,j in enumerate(I))+3)%p
                            for I in combinations(range(r),a)}
            coefficients[top] = 1
            def wedge_value(indices):
                if len(set(indices)) < len(indices):
                    return 0
                inversions = sum(indices[i] > indices[j]
                                 for i in range(a) for j in range(i+1,a))
                return (-1)**inversions*coefficients[tuple(sorted(indices))] % p
            retraction = [[(-1)**i*wedge_value([j]+[k for k in range(a) if k != i])%p
                           for j in range(r)] for i in range(a)]
            assert [row[:a] for row in retraction] == ident(a)
            splittings += 1

projectors = 0
for q in (2,3,5,7):
    for p in (5,7,11,13,17):
        eigen = [1,q%p,q*q%p]
        if q%p == 0 or len(set(eigen)) < 3:
            continue
        for i, lam in enumerate(eigen):
            for j, mu in enumerate(eigen):
                value = 1
                for k, nu in enumerate(eigen):
                    if k != i:
                        value = value*(mu-nu)*pow((lam-nu)%p,-1,p)%p
                assert value == int(i == j)
                projectors += 1
assert (4-1)%3 == 0  # weight-separated rational roots can collide mod 3.
print({"root_system_products":len(systems), "equal_rank_dimension_witnesses":witnesses,
       "exp_log_group_laws":group_laws, "determinant_splittings":splittings,
       "weight_projector_entries":projectors})
```

