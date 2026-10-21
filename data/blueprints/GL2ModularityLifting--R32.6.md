# GL₂ modularity lifting: transfer through congruences

This part specifies `GL2ModularityLifting:R32.6`. Its output is a modularity-transfer interface for a directed congruence between two families of two-dimensional representations of the absolute Galois group of ℚ. It separates three operations: identifying members of one family by their good Frobenius polynomials, applying a lifting theorem to a selected member of a second family, and identifying the remaining members of that second family. Only the middle operation needs modularity lifting.

The local lifting theorems belong to R32.2–R32.5. Their R32.6 transfer forms already have seven node IDs in [part R32.3](GL2ModularityLifting--R32.3.md). This part imports those nodes and adds one application theorem, `GL2ModularityLifting:R32.6/directed-polynomial-family-transfer`. It introduces no new representation, residual-representation or compatible-system definition. The packet records the imported IDs individually; they must remain single nodes when the parts are assembled.

The central application is a member at a ramified coefficient prime whose reduction is reducible. A de Rham lifting theorem can apply there even when the family's compatibility conditions give no Weil–Deligne comparison at that prime. Characteristic-zero irreducibility, oddness and the de Rham hypothesis remain explicit. The source-independence audit is a separate target: the transfer statements below do not certify that every auxiliary globalisation in their proofs avoids the full Serre theorem.

Independent review accepts this complete target-level pass with stage coverage `planned`, not `closed`. The exact normalized-newform endpoint has a recorded geometric-twist classification input. The two inherited system wrappers also retain higher-tier dependencies in their owner packet, which assembly must replace. Neither obligation is treated as completed by this continuation.

## Conventions and supplier interfaces

Write G_ℚ for the absolute Galois group with its Krull topology. A p-adic representation is continuous, two-dimensional, and defined over a specified finite extension of ℚ_p; notation with ℚ̄_p records an embedding of that finite coefficient field. This finite model is part of the input, so no compactness argument is used to infer a coefficient field inside ℚ̄_p. A residual representation means the semisimplified reduction of a stable lattice, extended to a specified algebraic closure of the residue field. Congruence means isomorphism of those semisimplifications after a common residue-field extension. It does not identify integral representations or nonsplit residual extensions.

Irreducibility of a selected p-adic member means irreducibility after extension to ℚ̄_p. Irreducibility only over its finite coefficient model is not the hypothesis imported from a lifting theorem stated over ℚ̄_p.

Arithmetic Frobenius is used throughout. For a normalized newform f of weight k≥2, level N and nebentypus ψ, its representation satisfies

\[
\det(X-\rho_{f,\lambda}(\operatorname{Frob}_q))
 = X^2-a_q(f)X+\psi(q)q^{k-1}\qquad(q\nmid N\ell).
\]

Here λ lies above ℓ. The cyclotomic character ε_p has Hodge–Tate weight 1. Regular normalized weights are {0,k−1}, k≥2; k=1 is excluded. Oddness means det ρ(c)=−1 for complex conjugation c in characteristic zero. In characteristic two that sign reduces to 1, so it cannot be recovered from the residual determinant.

The interfaces are imported at the following exact nodes.

| Input | Owner and export | Use |
|---|---|---|
| Coefficient extension | `ArithmeticGaloisRepresentations:R01.1/coefficient-extension` | Compare representations over a common local field, with embeddings specified. |
| Integral reduction | `ArithmeticGaloisRepresentations:R01.1/reduction-and-residual-semisimplification` | Reduce a stable lattice and transport its characteristic polynomials. |
| Independence of reduction choices | `ArithmeticGaloisRepresentations:R01.1/residual-representation-well-defined` | Change lattices or finite coefficient models without changing the residual isomorphism class. |
| Frobenius recognition | `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent` | Over one fixed residue characteristic, equal polynomials at a density-one unramified set identify semisimplifications after coefficient extension. |
| Newform representations for every λ | `AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation` | Supply the representations of a fixed newform and their displayed good-prime polynomials. |
| Absolute irreducibility of those representations | `AutomorphicGaloisRepresentations:R19.3/classical-newform-irreducibility` | Upgrade recognition of semisimplifications to identification with the actual newform realization, at every coefficient place. |
| Weight of a modular twist | `GL2ModularityLifting:R32.1/weight-of-modular-twist` | Convert an up-to-geometric-twist conclusion into a weight-k newform under the normalized weights. |
| Classification of the actual modularity twist | Requested from `GL2ModularityLifting:R32.1` | Supply the cyclotomic-times-finite-order form assumed by the preceding lemma, and exclude a weight-one witness using regularity. This input remains a gap. |
| Finite-order twists and primitive associates | Current TauCetiRoadmap, `ModularForms`, Layer 9 | Preserve weight and cuspidality, multiply good eigenvalues by the Dirichlet character and nebentypus by its square, and take the normalized primitive associate. |
| Normalizing an ordinary quotient | `GL2ModularityLifting:R32.5/ordinary-character-normalisation` | Twist by the inverse Teichmüller lift of the global residual constituent matching the actual unramified ordinary quotient. |

These are planned supplier exports, not declarations claimed to exist in the pinned libraries. Their definitions, APIs and unit tests stay with their owners. The uses here require coefficient-extension composition, reduction compatible with extension and twisting, invariance of residual semisimplification under lattice changes, and Frobenius recognition after deleting a finite exceptional set. There is no second implementation of any of those operations in R32.6.

The weight-of-modular-twist export assumes that its character is ε_p^m μ with μ of finite order and that the modular witness has weight at least two. It does not classify an arbitrary character occurring in an up-to-twist conclusion. The requested R32.1 input must establish those premises from the actual geometric representation and identify μ with a Dirichlet character, with the coefficient embeddings retained. Distinct weights can then be compared. Finite-order twisting uses the existing upstream analytic target; its Galois compatibility follows by multiplying the good-prime polynomials and applying recognition to the absolutely irreducible newform realizations. No higher-tier compatible-system or character-system constructor supplies this step here.

Checks on the imported interfaces include the following.

1. Changing a stable lattice may change the residual extension class but must preserve its semisimplification. A congruence interface comparing the full reductions fails this check.
2. Extending the coefficient field before reducing must agree with extending the residual field afterwards. Every congruence edge records both embeddings; merely naming the same rational prime does not fix them.
3. Frobenius recognition returns an isomorphism of semisimplifications on both sides. The family members are assumed semisimple, and R19.3 separately supplies absolute irreducibility of the newform realizations. Both facts are needed to identify the actual representations. The R19.1 construction and polynomial formula alone are not the irreducibility theorem.
4. With arithmetic Frobenius, the constant coefficient for a weight-k newform is ψ(q)q^(k−1). Replacing Frobenius by its inverse without changing this polynomial fails the normalization check.

## Selected-member transfer theorems

The following four local alternatives are imports. Their proofs remain in the existing lifting stages. They describe precisely when a congruence can be used; they are not assertions that an arbitrary congruent lift is modular.

Some Q-level sources state the weight-k conclusion directly; other lifting forms conclude modularity up to a character twist. When the latter form is used, every exact-weight assertion below consumes the normalization input just specified. Comparing weights is not a substitute for that input.

### Odd prime with irreducible cyclotomic restriction

Import `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`. Let p be odd, and let ρ and ρ′ be continuous, odd and finitely ramified p-adic representations with isomorphic residual semisimplifications. Suppose that their restrictions at p are de Rham with weights {0,k−1} and {0,k′−1}, k,k′≥2, and that the common residual representation remains absolutely irreducible on G_ℚ(ζ_p). Then ρ is modular if and only if ρ′ is modular. The weights and local types can differ.

The equivalent quadratic-field test is absolute irreducibility on G_ℚ(√p*), where p*=(-1)^((p−1)/2)p. The equivalence is the existing R32.1 quadratic/cyclotomic restriction lemma; it is not an additional assumption on the lift. At p=3 the field is ℚ(√−3)=ℚ(ζ₃). The odd-prime theorem includes 3.

For a direction of transfer, a modular source lift provides the residual modularity required by the lifting theorem for the target. No appeal to an unconditional residual-modularity theorem is needed at that step. Absolute irreducibility of the residual representation itself is weaker than irreducibility on the cyclotomic subgroup: bad-dihedral cases do not enter this branch.

Sources: Dieulefait–Pacetti, Theorem 1.4, arXiv v2 p.4; Tung's odd-prime paper, Theorem 4.7 and Remark 4.8, p.15; Dieulefait–Pacetti, Lemma 1.13, pp.7–8. The passage from de Rham to potentially semistable belongs to `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, already imported by the lifting owner. The mathematical statement retains residual modularity rather than replacing it with Pan's unconditional residually irreducible corollary.

### The dyadic alternative

Import `GL2ModularityLifting:R32.6/transfer-dyadic`. Let ρ and ρ′ be odd, continuous and finitely ramified 2-adic representations, de Rham at 2 with distinct Hodge–Tate weights, and with isomorphic residual representations of nonsolvable image. Then modularity transfers in either direction. Nonsolvability implies residual absolute irreducibility and hence irreducibility of the lifts. Normalized weights identify each newform's own weight.

Tung's Theorem A, arXiv v3 p.2, retains residual modularity as a hypothesis and removes the older local exclusion at 2. It is the Q-level theorem used here. The earlier combined theorem in the introduction must not be substituted with its local exclusion silently discarded. No local-type equality between the two selected lifts is required by this interface.

Oddness is a characteristic-zero input on each target lift. A residual representation with determinant 1 at complex conjugation, or even an identity residual matrix there, supplies no such input at 2. A congruence with solvable residual image is outside the dyadic theorem.

Sources: Dieulefait–Pacetti, Theorem 1.5, p.4; Tung's dyadic paper, Theorem A, p.2. The dyadic local support and globalisation work belongs to R32.3 and its completed-cohomology suppliers.

### Reducible reduction: Pan's range

Import `GL2ModularityLifting:R32.6/transfer-residually-reducible`. Let ρ be continuous, irreducible in characteristic zero, odd and finitely ramified, de Rham at p with distinct Hodge–Tate weights. Suppose its residual semisimplification is χ̄₁⊕χ̄₂. If p≥5, then ρ is modular up to the stated twist convention. If p=3 the same assertion requires

\[
(\bar\chi_1\bar\chi_2^{-1})|_{G_{\mathbf Q_3}}\ne\omega_3.
\]

For normalized weights {0,k−1}, the result gives a newform of weight k. This branch does not need a modular source lift or a residual modularity hypothesis. It can start modularity in a chain rather than merely transfer it. It also needs neither ordinarity nor a Weil–Deligne equality at p.

Characteristic-zero irreducibility cannot be omitted. A direct sum of two characters is not made cuspidal by satisfying a regular weight condition. Reducibility of the reduction and reducibility of the p-adic representation are different tests. At 3, the local ratio exclusion is a real restriction, not a restriction to p≥5 imposed merely for convenience. The inverse ratio gives the same exceptional case because ω₃ has order two.

Sources: Pan, Theorem 1.0.2, arXiv v2 p.3, with the hypotheses of Conjecture 1.0.1 on pp.2–3; Dieulefait–Pacetti, Theorem 1.6, p.4. The ordinary and nonordinary proofs of Pan's theorem are already targets of R32.4 and the ordinary-lifting supplier. The target here is their application, not another patching development.

### The exceptional ordinary branch at 3

Import `GL2ModularityLifting:R32.6/transfer-ordinary-three` and the single-representation export `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`. Suppose ρ is continuous, irreducible, odd and finitely ramified over a finite extension of ℚ₃. After a specified finite-order twist, write the normalized representation as τ. Require all of:

- the global residual semisimplification of τ is 1⊕ω₃;
- its restriction to inertia at 3 is upper triangular with quotient character 1;
- det τ=ψ ε₃^(k−1), with k≥2 and ψ of finite order.

Then τ, and hence ρ after undoing the finite-order twist, is modular of weight k. The residual ratio is nontrivial on the decomposition group at 3, as required by Skinner–Wiles. It is also exactly the exceptional ratio excluded by Pan at 3.

The normalization comes from the actual ordinary quotient. If β̄ is the global residual constituent whose restriction is that quotient, let η be its finite-order Teichmüller lift and twist by η^−1. The quotient is then unramified and is trivial on inertia. The determinant changes by η^−2; its finite-order factor remains finite order. Finite-order twists preserve Hodge–Tate weights. Arbitrarily choosing the other residual constituent or twisting by an inverse cyclotomic character is not this normalization.

For a pair of congruent lifts, ordinarity and the quotient normalization must be checked for each direction's target. A congruence does not transfer the inertia-quotient condition. If both lifts separately satisfy the ordinary theorem, both are modular, so their modularity is equivalent without a further lifting argument. The crystalline weights 2 and 4 used in the terminal application are handled by the existing R32.5 crystalline-to-ordinary target; no general crystalline-reducible-implies-ordinary assertion is made here.

Sources: Skinner–Wiles, introduction main theorem, printed p.6, read on the Numdam page image; Dieulefait–Pacetti, Theorem 1.7 and Remark 2, arXiv pp.4–5. The finite-order qualification on ψ is essential. It is the already recorded `GL2ModularityLifting/E10`; this part retains that correction rather than creating a second finding.

## Directed transfer between two families

The new application theorem is `GL2ModularityLifting:R32.6/directed-polynomial-family-transfer`. Here is its full interface, without a dependency on the higher-tier compatible-system roadmap.

For i=A,B, give a number field E_i, a finite set S_i of rational primes, and a family of continuous semisimple representations ρ_i,λ indexed by the finite places λ of E_i. Each member has a specified finite local coefficient model. For q outside S_i give a polynomial P_i,q in E_i[X] of degree two. Require that, when λ lies above ℓ and q≠ℓ, the member is unramified at q and its arithmetic-Frobenius characteristic polynomial is the image of P_i,q. These are ordinary indexed representation and polynomial data, not a new mathematical carrier or a newly defined compatibility predicate.

Choose places λ_A,λ_B above a common prime p. Give coefficient embeddings into ℚ̄_p, stable lattices and an isomorphism of residual semisimplifications over F̄_p. The two selected characteristic-zero members remain irreducible over ℚ̄_p, are odd and finitely ramified, and are de Rham with weights {0,k_A−1} and {0,k_B−1}, k_A,k_B≥2. The assertion has four alternatives:

| Alternative | Additional condition at the selected member | Modular seed |
|---|---|---|
| Odd irreducible | p odd; common residual restriction to G_ℚ(ζ_p) absolutely irreducible | Some A-member is attached to a normalized cuspidal newform of weight at least two. |
| Dyadic | p=2; common residual image nonsolvable | Some A-member is attached to a normalized cuspidal newform of weight at least two. |
| Pan reducible | p≥5, or nonexceptional local ratio at p=3; B has reducible residual semisimplification | None. |
| Ordinary-three | The specified normalized B-member satisfies the three ordinary hypotheses above | None. |

The conclusion is that there is a normalized cuspidal newform g of weight k_B such that every B-member, after common coefficient extension with compatible algebraic embeddings, is isomorphic to the corresponding realization of g. In the last two alternatives the entire A-family and congruence can be omitted. De Rham hypotheses at other members of B are unnecessary for this recognition argument. Conversely, if a direction of an irreducible or dyadic bridge has its target hypotheses checked on A as well, the same argument gives the reverse implication. There is no blanket undirected equivalence under hypotheses checked only on B.

The proof has six steps; the fourth records an outstanding supplier input.

1. In the seeded alternatives, take a newform f realizing the known A-member. Pass to a compositum of E_A and the coefficient field of f, using the relative embedding determined by that realization. Equality of the polynomials in one local algebraic closure is equality of algebraic numbers because the coefficient embedding is injective. Thus P_A,q and the good polynomial of f agree in that compositum for every q outside a finite exceptional set.
2. Extend the specified embedding of E_A at λ_A to the compositum. Frobenius recognition identifies the selected A-member with the corresponding f-realization, using semisimplicity of A and absolute irreducibility of the newform representation. Reduce its stable lattice; independence of the residual class from the lattice and finite coefficient model transports modularity through the specified congruence.
3. Apply the odd or dyadic transfer to obtain modularity of the selected B-member. In a reducible alternative apply Pan or the normalized Skinner–Wiles theorem directly to B. Retain whether the chosen source form gives exact attachment or attachment only up to a character twist.
4. In an up-to-twist conclusion ρ_B,λB≅ρ_h⊗χ, supply the requested classification of χ as ε_p^m μ with μ of finite order, and the exclusion of a weight-one witness. The present R32.1 weight lemma assumes these inputs. This classification remains a recorded gap; the weight-k endpoint is therefore a planned target, not a closed export.
5. Now compare {0,k_B−1} with {m,m+k′−1}, where k′≥2. This forces m=0 and k′=k_B. Use upstream ModularForms Layer 9 to twist h by the Dirichlet character corresponding to μ, then take its normalized primitive associate g. The twist need not itself be new at its displayed level. The good eigenvalues are multiplied by μ(q), and the nebentypus by μ². The R19.1 polynomial formula and recognition therefore identify the Galois twist with g's realization. The same finite-order argument undoes η in the ordinary-three branch.
6. Compare P_B,q with g's polynomial in the relative compositum determined by the selected B-realization. For every other B-place extend its specified embedding of E_B to that compositum and a common local coefficient field. Remove the finite ramification sets, g's level primes and that member's residue characteristic. Recognition gives equality of semisimplifications. The assumed semisimplicity of the B-member and R19.3 irreducibility of the g-realization identify the actual representations.

No representation over ℚ̄_p is compared directly to one over ℚ̄_ℓ when p≠ℓ. The passage across characteristics takes place through the common algebraic polynomial coefficients; the representation-theoretic recognition theorem is applied separately at each characteristic. The newform attached to B need not be the source newform f: the congruence can change weight, level and type. Within a single B-family, all members use the one target newform g with the compatible coefficient embeddings.

Sources: Dieulefait–Pacetti, Theorems 1.4–1.7, pp.4–5, Definition 1.10 and Remark 4, pp.6–7, and their congruence applications in §2, pp.10–14. The directed family theorem is a composition of these inputs and the named recognition export, not a separately numbered theorem of that paper.

## A ramified reducible coefficient prime

The existing owner is `GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime`. Let λ lie above p in a rank-two family of normalized weight k>1, and suppose p belongs to its fixed ramification set S. Require that its selected member is characteristic-zero irreducible, odd, finitely ramified and de Rham, and that its residual semisimplification is reducible. At p≥5, Pan gives modularity of the selected member; good-prime recognition then identifies every semisimple member with the same newform's realizations. At 3, one must check the nonexceptional ratio or the ordinary-three hypotheses. There is no reducible dyadic alternative here.

Dieulefait–Pacetti's almost-strict convention retains clauses (1)–(5) of Definition 1.10. In particular, de Rham behavior at every coefficient place and the weights {0,k−1} remain data. The weakened clause (6) may withhold the coefficient-prime Weil–Deligne comparison when the reduction is reducible: at such a member it requires that comparison only under the stated odd-prime and unramified-system-parameter condition. Hence at a ramified system parameter one may have de Rham behavior without a specified WD equality. The lifting theorem consumes precisely that remaining geometric input.

A historical Khare–Wintenberger almost-strict carrier is weaker at this point: its name does not supply the all-member de Rham assertion. To apply the theorem to that carrier, separately provide the selected member's de Rham property and its weights. Neither good Frobenius polynomials nor the word “almost” establishes them. Strict compatibility and crystallinity at the selected ramified prime are not needed.

The companion existing target `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems` is realized by applying this interface to a family with the DP data. System existence remains a separate supplier theorem. In particular this application does not prove DP Theorem 1.11 in a generality absent from its cited construction.

This is the resolution of `RT-AREA-langlands-2/21`: R32.6 owns the modern ramified reducible transfer. R24.6 supplies its family and reduction adapters and imports the transfer. No R24.6 theorem is used in the proof here. The new application accepts polynomial data directly, so it also respects the tier order: GL2ModularityLifting is tier 21, while PotentialModularityAndCompatibleSystems is tier 22.

This ownership resolution does not repair the two older wrappers' dependency lists in R32.3. Those lists still cite R24.5, including a reducibility-across-λ theorem that the new application avoids by requiring irreducibility only at the selected member. The wrappers' mathematical applications are specializations of the polynomial-data theorem, but their inherited dependency closure is outside this continuation's acceptance. Assembly must express them through that lower-tier theorem and keep the generic system adapters in R24. This is a recorded gap in dependency closure; planned coverage does not assert that the old graph already respects the tiers. The R19.3 classical-newform-irreducibility supplier also cites R24.5/character-system in its own proof plan. Its mathematical statement is the required lower-tier contract, but its owner must reconcile that transitive edge through lower-tier character classification. The absence of a direct R24 prerequisite in the new theorem is not a certificate for every supplier’s tier closure.

Sources: Dieulefait–Pacetti, Definition 1.10 and the almost-strict modification, pp.6–7, Remark 4, p.7, and Paso 5(1), p.14. The latter is the intended use: the de Rham hypothesis survives precisely where the coefficient-prime local comparison is unavailable.

## Dependency audit for an independent Serre route

The single audit owner remains `GL2ModularityLifting:R32.6/globalisation-dependency-audit`. Its consumer is `ClassicalSerreModularity:R33.5/globalisation-dependency-check`. The required output is an audit of the actual proofs' global inputs, rather than an inference from their displayed hypotheses. The following distinctions are part of that output.

The inherited odd-transfer node also contains an assurance that no Serre conjecture is used. That assurance is stronger than its own conditional audit and is not adopted here. The owner or assembly job must remove it until the transitive certificate exists. R31.6 supplies the dependencies of its globalisation and support inputs to this audit; it does not become a second audit owner.

| Proof input | Precisely supported use | Independence boundary |
|---|---|---|
| Tung, odd-prime Theorem 4.7, p.15 | Retains residual modularity as a hypothesis. | Local Breuil–Mézard and patching globalisations still need their own audit. |
| Tung, dyadic Theorem A, p.2 | Starts from a modular residual representation of nonsolvable image. | Its local support theorem also needs an auxiliary suitable globalisation. |
| Pan, Theorem 1.0.2, p.3 | Reducible residual semisimplification, with the exceptional-three exclusion. | Do not substitute the unconditional residually irreducible consequence. |
| Pan, Remark 8.0.4, p.125 | Explicitly obtains residual modularity over ℚ from the full Serre theorem. | Exclude that shortcut from an independent proof of Serre. |
| Hu–Tan, Theorem 6.3 and proof, p.35 | A lifting theorem for an already modular residual representation. | The final deduction of their unconditional Theorem 1.4 invokes Khare–Wintenberger. |
| Emerton, §7.3, p.96 | The proof of Theorem 1.2.3 invokes full Serre. | Exclude this promodularity shortcut. |
| Emerton, §7.4, pp.96–97 | Theorem 3.3.22 uses an explicitly CM-induced modular residual representation and the weight part for that representation. | Supply the restricted weight-part proof with its own independent dependencies; the source's construction alone is not the certificate. |

Tung's dyadic §4.3, pp.20–21, makes the auxiliary problem explicit. Definition 4.3.2 asks for a totally real field of even degree, completely split coefficient prime, prescribed local residual representations, nonsolvable global residual image, controlled ramification and a suitable automorphic realization. Lemma 4.3.3 constructs such a globalisation using Calegari Proposition 3.2, Snowden Proposition 8.2.1, and the dyadic local HBAV construction cited as published Khare–Wintenberger II, Theorem 6.1. Lemma 4.3.4 changes weight and local behavior of an already automorphic residual representation, using Paškūnas Lemma 3.29 and Khare–Wintenberger II, Lemma 3.5. These are different tasks from assuming modularity of the final residual representation over ℚ.

The inspected proof paths give the following more precise obligations:

- Calegari, Proposition 3.2, arXiv v2 pp.5–6, constructs a potential finite-group globalisation with prescribed local extensions, splitting and auxiliary disjointness. Its proof uses an invariant-theoretic quotient, an open smooth locus, the preceding Moret–Bailly theorem and auxiliary Frobenius classes forcing the full group. No full-Serre step appears in that immediate proof. The geometric input's own dependency closure still belongs in the certificate.
- Snowden, Propositions 8.2.1–8.2.2, p.26, imposes splitting on the potential modularity extension through a modified Moret–Bailly construction. It then uses solvable descent, Proposition 8.1.1. That descent in turn invokes the lift-existence Theorem 7.6.1 and modularity-lifting Theorem 4.4.2; the potential modularity step invokes Theorem 5.1.1. Reading §8 therefore identifies the next proof obligations, rather than certifying the whole chain. Its odd-prime argument alone does not prove Tung's dyadic extension.
- Paškūnas, Lemma 3.29 and proof, p.43, assumes a modular absolutely irreducible residual representation over a totally real field of even degree with 2 split. It uses quaternionic forms, exactness, reduction and lifting of weights, and Jacquet–Langlands to reach parallel weight two with the stated semistable local alternatives. It does not assert modularity for an arbitrary residual representation. The remaining KW II local input and earlier exactness/local lemmas must remain in the dependency trace.
- CEG+16, §2.1, pp.15–17, obtains an automorphic suitable globalisation from Emerton–Gee (EG14), Corollary A.7. It uses Proposition A.2 and BLGGT14 potential automorphy to arrange the additional large-image property. Its local hypotheses include p not dividing 2n and existence of a regular potentially diagonalizable lift; Lemma 2.2 supplies the latter when n=2. These are the exact further leaves to certify, rather than an appeal to residual modularity over ℚ.
- Emerton–Paškūnas, Theorem 6.3 and proof, p.26, gives support equal to a union of irreducible components. It does not by itself give full support on every deformation ring. Tung, Proposition 3.9 and proof, p.12, adds irreducibility and reducedness of the relevant unrestricted local deformation space, with its stated exceptional cases, and uses density to deduce faithfulness. A certificate must retain those local-ring and density inputs, as well as the patched-module construction.
- BLGG13, Theorem A.4.1 and proof, pp.36–42, assumes an automorphic residual realization over a CM extension in addition to adequacy, polarization and regular potentially diagonalizable local lifts. Its proof uses BLGGT change of weight and descent to match components. CEG+16, Corollary 5.4, pp.78–79, uses it for automorphic component support. Adequacy alone must not be substituted for the existing seed assumption.

The `CompletedCohomologyAndLocalGlobalCompatibility:R31.6` request names these obligations. The `SerreWeightAndLevelOptimisation:R20.6` request names the restricted weight part in Emerton §7.4 and the precise edition of Gee's *Automorphic lifts of prescribed types* cited by Kisin (2.2.17) as Theorem 4.4.12. The current author PDF inspected here instead has Theorem 4.6.9, p.26: for p>2 completely split in a totally real field, it assumes residual modularity and irreducibility on the cyclotomic subgroup before identifying modular weights. Its immediate proof invokes Proposition 4.6.6 and Lemma 4.6.8. The two numbered results require collation before the latter can certify the former's use. Their precise source versions, hypotheses and proof paths are required before the audit can certify independence. The packet records this as an open gap. The review pass is complete; stage coverage is `planned`, with the additional normalization and inherited-wrapper gaps specified above. It is not `closed`.

## Checks and worked applications

**Changing weight at an irreducible odd prime.** Choose selected members with weights {0,1} and {0,3}. If their residual semisimplifications agree and the common restriction to G_ℚ(ζ_p) is absolutely irreducible, a modular source member gives a weight-four target newform. The theorem does not require identical Hodge–Tate weights. A bad-dihedral restriction fails the branch condition even when the residual representation over G_ℚ is absolutely irreducible.

**Starting at a ramified reducible member.** Take p=5 in S_B and a characteristic-zero irreducible odd de Rham B-member with weights {0,3} and reducible residual semisimplification. The Pan branch yields a weight-four newform and identifies the entire B-family at its good primes. This is a conditional interface example, not a claim that a particular level or residual representation exists. It tests that no coefficient-prime WD comparison or crystallinity is demanded, and that no modular A-family is required.

**The exceptional ratio at 3.** For residual semisimplification 1⊕ω₃, exchanging the two summands does not escape Pan's excluded ratio. If the target has the specified ordinary quotient and finite-order determinant normalization, Skinner–Wiles applies. If those hypotheses are missing, this interface supplies no conclusion. No assertion that all such missing cases are nonmodular is intended.

**Dyadic oddness.** Over ℤ, diag(1,−1) has determinant −1. Reducing the same matrix modulo 2 gives the identity and determinant 1, just as reducing diag(1,1) does. This tests why characteristic-zero oddness must remain an input at 2. Nonsolvability is checked separately on the residual image.

**Normalizing a character.** For any two-by-two matrix M and invertible scalar a, det(a^−1 M)=a^−2 det M. Consequently a finite-order character normalization contributes the square of its inverse to the determinant, not one copy. At p=3 the residues 1 and −1 are distinct, pinning the nontrivial cyclotomic ratio in the ordinary branch.

**A finite congruence chain.** Record for each edge its prime, two coefficient places, their embeddings, residual comparison, selected target weight, target geometric conditions and branch. Propagate a modular seed in the direction justified by that record. A reducible Pan or ordinary-three vertex can instead supply a seed. To propagate backwards along an edge, check the local hypotheses on the new target. Switching from one member of the same family to another uses only the common good polynomials and semisimplicity. The zero-edge chain simply retains its seed and requires no lifting theorem.

**Boundary failures.** Repeated weights do not satisfy the regular de Rham lifting interfaces. Missing de Rham data at a ramified coefficient prime cannot be recovered from weak compatibility. Solvable residual image at 2 does not satisfy the dyadic theorem. Agreement modulo p is weaker than equality of characteristic-zero good polynomials and cannot itself trigger Frobenius recognition. These checks distinguish the local lifting step from the two family-recognition steps.

**Normalizing an up-to-twist witness.** The equality {0,k−1}={m,m+k′−1}, with k,k′≥2, forces m=0 and k′=k. It gives no classification of a character that has not yet been shown to be ε_p^m times finite order. A proof that invokes the weight lemma before supplying that character form fails this check. After a finite-order twist, taking the primitive associate is also necessary to justify the word “newform.”

## Library and suggested-file boundary

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed library-coverage file has no direct GL2ModularityLifting entry. Its R31.6 and R33.5 records do route the independence obligation here; absence of a direct entry is not evidence of an implemented lifting theorem.

Current TauCetiRoadmap and current Tau Ceti were also checked. ProfiniteArithmetic and LocalGaloisGroups already cover the profinite and cyclotomic foundations; ModularForms already covers the analytic Hecke and newform development; IntegralHeckeAndGaloisDeterminants already covers determinant reconstruction. Those developments are inputs, never new R32.6 targets. The arithmetic realization and recognition interfaces above remain assigned to their existing R01/R19 owners.

The pinned sources do supply `Matrix.det_smul` and `Matrix.det_fin_two` in `Mathlib.LinearAlgebra.Matrix.Determinant.Basic`; their statements were read at the pin. The [suggested file](../suggested/GL2ModularityLifting--R32.6.lean) gives four acceptance examples over those existing matrix and residue-ring carriers. It introduces no definitions. The file omits the arithmetic transfer signature because the combined representation, residual, de Rham and attached-newform carriers are not available at the pins. A generic proposition parameter called “modularity” or a data structure with proposition-valued placeholders would not test that arithmetic interface. All arithmetic targets, including the seven imported targets and the new directed theorem, therefore remain fully specified here rather than being represented by surrogate Lean statements.

## Source editions

Locators above refer to these versions; the packet records their downloaded SHA-256 values and precisely which passages were read. The reader states the mathematics in its own words.

- Dieulefait–Pacetti, *A simplified proof of Serre's conjecture*, [arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2), pp.4–7 and 10–14 for the lifting and family applications. The [published article](https://doi.org/10.1007/s13398-023-01478-8) was also consulted for Definition 1.10 and Remark 4, publisher PDF p.7; the downloaded arXiv version fixes the locators here.
- Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, [arXiv:1901.07166v2](https://arxiv.org/pdf/1901.07166v2), pp.2–3 and 124–125.
- Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_ℚp*, [arXiv:1803.07451v4](https://arxiv.org/pdf/1803.07451v4), pp.12–15.
- Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, [arXiv:1908.06174v3](https://arxiv.org/pdf/1908.06174v3), pp.1–2 and 20–21. No assertion about collation with its version of record is needed for the Q-level Theorem A used here.
- Skinner–Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999), [Numdam scan](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), printed p.6 / PDF p.3, read visually.
- Paškūnas, *On 2-dimensional 2-adic Galois representations of local and global fields*, [arXiv:1509.00332v2](https://arxiv.org/pdf/1509.00332v2), pp.1–5 and 43.
- Emerton, *Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ*, [author preprint](https://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), §§7.3–7.4, pp.96–97.
- Hu–Tan, *The Breuil–Mézard conjecture for non-scalar split residual representations*, [arXiv:1309.1658v2](https://arxiv.org/pdf/1309.1658v2), Theorem 6.3 and proof, p.35.
- Calegari, *Even Galois representations and the Fontaine–Mazur conjecture II*, [arXiv:1012.4819v2](https://arxiv.org/pdf/1012.4819v2), Proposition 3.2 and proof, pp.5–6.
- Snowden, *On two dimensional weight two odd representations of totally real fields*, [author preprint of 26 May 2009](https://websites.umich.edu/~asnowden/papers/wt2-052609.pdf), §8, p.26.
- Gee, *Automorphic lifts of prescribed types*, [author PDF](https://www.ma.imperial.ac.uk/~tsg/Index_files/prescribedlifts.pdf), Theorem 4.6.9 and proof, p.26, and the preceding Lemma 4.6.8 proof, pp.25–26. The hash identifies the edition; no collation with the differently numbered Kisin citation is asserted.
- Barnet-Lamb–Gee–Geraghty, *Serre weights for rank two unitary groups*, [author PDF](https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf), Theorem A.4.1 and proof, pp.36–42.
- Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, *Patching and the p-adic local Langlands correspondence*, [author PDF](https://www.ma.imperial.ac.uk/~tsg/Index_files/Gpatching.pdf), §2.1, pp.15–17, and Corollary 5.4, pp.78–79.
- Emerton–Paškūnas, *On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras*, [arXiv:1809.06598v3](https://arxiv.org/pdf/1809.06598v3), Theorem 6.3, Remark 6.4 and Theorem 6.5's recalled inputs, pp.26–28. The transitive geometric and potential-automorphy inputs named above have not all been inspected; this bibliography does not certify them.
